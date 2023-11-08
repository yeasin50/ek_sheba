import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../widgets/pdf_viewer.dart';

class PDFPage extends StatelessWidget {
  const PDFPage({
    super.key,
    required this.path,
    required this.title,
    this.isTokenRequired = true,
  });

  final String path;
  final String title;
  final bool isTokenRequired;
  static const String routeName = '/pdf';

  @override
  Widget build(BuildContext context) {
    // logger.d('PDFPage: ${path}');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: isTokenRequired
                    ? FutureBuilder(
                        future: TokenManager.getToken(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error loading PDF $path'));
                          } else if (!snapshot.hasData || snapshot.data == null) {
                            return Center(child: Text('No PDF data available $path'));
                          } else {
                            return PDFViewerScreen(
                              pdfUrl: path,
                              title: title,
                              token: snapshot.data!,
                            );
                          }
                        },
                      )
                    : PDFViewerScreen(
                        pdfUrl: path,
                        title: title,
                        token: null,
                      )),
          ],
        ),
      ),
    );
  }
}
