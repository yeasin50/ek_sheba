import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../helpDesk/presentation/widgets/widgets.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;
  final String token;

  final String? title;

  const PDFViewerScreen({
    super.key,
    required this.pdfUrl,
    required this.token,
    this.title,
  });

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late PDFViewController pdfViewController;

  Uint8List? pdfData;

  ValueNotifier<bool> isLoaded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MinimalAppBar(
            title: widget.title ?? 'PDF',
            action: ValueListenableBuilder(
                valueListenable: isLoaded,
                builder: (context, value, child) {
                  logger.d('PDFPage: $value');
                  return IconButton(
                    onPressed: value ? () => downloadPDF(pdfData!, widget.title ?? 'PDF') : null,
                    icon: Icon(Icons.download, color: value ? Colors.green : Colors.grey),
                  );
                }),
          ),
          Expanded(
            child: FutureBuilder(
              future: loadPDF(widget.pdfUrl, widget.token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading PDF'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(child: Text('No PDF data available'));
                } else {
                  return PDFView(
                    pdfData: snapshot.data,
                    onViewCreated: (controller) {
                      pdfViewController = controller;
                      isLoaded.value = true;
                      pdfData = snapshot.data;
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List?> loadPDF(String pdfUrl, String token) async {
    try {
      final response = await http.get(
        Uri.parse(pdfUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/temp.pdf';

        final File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        return response.bodyBytes;
      } else {
        throw Exception('Failed to load PDF');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  //download pdf
  Future<bool?> downloadPDF(Uint8List data, String name) async {
    logger.i('downloadPDF: $name');

    bool isPermissionGranted = await Permission.storage.isGranted;
    logger.d('isPermissionGranted: $isPermissionGranted');

    if (!isPermissionGranted) {
      final status = await Permission.storage.request();
      if (status.isDenied) {
        // Handle permission denied
        logger.d('Permission denied');
        return false;
      }
    }

    String? path = await FilePicker.platform.getDirectoryPath();
    if (path == null) return false;

    logger.d('value: $path');
    final file = File('$path/$name.pdf');
    await file.writeAsBytes(data);
    logger.d('File saved to ${file.path}');
    return true;
  }
}

@Deprecated('Not using')
Future<Directory> _getDownloadsDirectoryPath() async {
  final List<Directory>? externalStorageDirectories =
      await getExternalStorageDirectories(type: StorageDirectory.downloads);

  if (externalStorageDirectories != null && externalStorageDirectories.isNotEmpty) {
    return externalStorageDirectories.first;
  } else {
    return Directory('/storage/emulated/0/Download');
  }
}
