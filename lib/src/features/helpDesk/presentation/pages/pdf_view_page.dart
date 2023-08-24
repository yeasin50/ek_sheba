import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../../../../common/utils/logger.dart';
import '../../../../common/widgets/background.dart';
import '../widgets/minimal_appbar.dart';

/// preview pdf from url
class PDFViewPage extends StatelessWidget {
  const PDFViewPage({
    super.key,
    required this.url,
    required this.title,
    required this.uid,
  });

  final String url;
  final String title;
  final String uid;
  static const routeName = "/pdf_view";

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(title: title),
          Expanded(
            child: PDF(
              autoSpacing: false,
              onError: (error) {
                logger.e(error);
              },
            ).cachedFromUrl(
              url,
              placeholder: (progress) => Center(child: Text("$progress %")),
              errorWidget: (error) => Center(child: Text(error.toString())),
            ),
          )
        ],
      ),
    );
  }
}
