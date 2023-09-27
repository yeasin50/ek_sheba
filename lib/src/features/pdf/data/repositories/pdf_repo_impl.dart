import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:http/http.dart' as http;
import '../../../../common/utils/utils.dart';

class PdfRepositoryImpl {
  static Future<Uint8List?> loadPDF(String pdfUrl, String? token) async {
    try {
      Map<String, String>? headers;
      if (token != null) {
        headers = {};
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.get(Uri.parse(pdfUrl), headers: headers);

      if (response.statusCode == 200) {
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
  static Future<bool?> downloadPDF(Uint8List data, String name) async {
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

  static Future<bool> directDownload(String url,  {required String name,  String? token}) async {
     final data  = await loadPDF(url, token);
      if(data == null) return false;
      return await downloadPDF(data, name)?? false;
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
}
