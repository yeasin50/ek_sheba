import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:my_utils/my_utils.dart';

import '../../../helpDesk/presentation/widgets/widgets.dart';
import '../../data/repositories/pdf_repo_impl.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewerScreen extends StatefulWidget {
  final String pdfUrl;
  final String? token;

  final String? title;

  const PDFViewerScreen({
    super.key,
    required this.pdfUrl,
    this.token,
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
                    onPressed: value ? () => PdfRepositoryImpl.downloadPDF(pdfData!, widget.title ?? 'PDF') : null,
                    icon: Icon(Icons.download, color: value ? Colors.green : Colors.grey),
                  );
                }),
          ),
          Expanded(
            child: FutureBuilder(
              future: PdfRepositoryImpl.loadPDF(widget.pdfUrl, widget.token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  final error = (snapshot.error as Map?)?['message'].toString() ?? "";
                  return Center(child: Text(error.isEmpty ? 'unable to find PDF' : error));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  final error = (snapshot.error as Map?)?['message'].toString() ?? "";
                  return Center(child: Text(error.isEmpty ? 'unable to find PDF' : error));
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
}
