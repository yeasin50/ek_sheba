import 'dart:typed_data';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerPage extends StatelessWidget {
  final Uint8List pdfBytes; // Replace with the actual PDF content

  PdfViewerPage({required this.pdfBytes});

  @override
  Widget build(BuildContext context) {
    logger.i(pdfBytes);
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        pdfData: pdfBytes,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.WIDTH,
      ),
    );
  }
}
