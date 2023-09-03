import 'dart:io';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'package:flutter/material.dart';

class DummyPDFTest extends StatefulWidget {
  const DummyPDFTest({super.key});

  @override
  State<DummyPDFTest> createState() => _DummyPDFTestState();
}

class _DummyPDFTestState extends State<DummyPDFTest> {
  getDoc() async {
    // The URL of the PDF you want to download.
    final pdfUrl = 'https://pspdfkit.com/downloads/pspdfkit-flutter-quickstart-guide.pdf';
    final uri = Uri.parse(pdfUrl);
    // Fetch the PDF from the URL.
    final pdfResponse = await http.get(uri);

    // Check the response status code. If it's not `200` (OK), throw an error.
    if (pdfResponse.statusCode != 200) {
      throw Exception('Failed to download PDF');
    }

    Directory tempDir = await getTemporaryDirectory();
    final dirExists = await tempDir.exists();

    if (!dirExists) {
      await tempDir.create();
    }

    String tempPath = tempDir.path;

    // Create a file to store the PDF.
    final pdfFile = File('$tempPath/my-pdf.pdf');

    // Write the PDF data to the file.
    await pdfFile.writeAsBytes(pdfResponse.bodyBytes);

    // Use the PSPDFKit `PdfViewer` to display the PDF document.
    final pdfDocument = await Pspdfkit.present(pdfFile.path);

    return pdfDocument;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF().cachedFromUrl('http://africau.edu/images/default/sample.pdf'),
    );
  }
}
