import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;
  final String token;

  PDFViewerScreen({required this.pdfUrl, required this.token});

  @override
  _PDFViewerScreenState createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late PDFViewController pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: FutureBuilder(
        future: loadPDF(widget.pdfUrl, widget.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No PDF data available'));
          } else {
            return PDFView(
              filePath: snapshot.data!,

              onViewCreated: (controller) => pdfViewController = controller,

              // },
            );
          }
        },
      ),
    );
  }

  Future<String?> loadPDF(String pdfUrl, String token) async {
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

        return filePath;
      } else {
        throw Exception('Failed to load PDF');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
