import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';
import '../../domain/entities/resource_info.dart';
import 'view_download_row.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
    required this.resourceInfo,
    this.onDownload,
    this.onView,
    this.onTap,
  });

  final ResourceInfo resourceInfo;
  final VoidCallback? onView;
  final VoidCallback? onDownload;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF282020),
      decoration: TextDecoration.underline,
    );

    final descriptionTextStyle = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6E7D91),
    );

    Row buildCategorySummaryRow(bool isCategory, String text) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCategory ? "Category:" : "Summary:",
            style: labelTextStyle.copyWith(
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
            maxLines: 1,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              string2Raw(text) ?? "not found",
              style: descriptionTextStyle,
              maxLines: 2,
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: AppStyle.boxShadow,
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    string2Raw(resourceInfo.title) ?? "",
                    style: labelTextStyle,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  buildCategorySummaryRow(true, resourceInfo.category ?? "NUll"),
                  const SizedBox(height: 8),
                  buildCategorySummaryRow(false, resourceInfo.summary ?? "Null"),
                  const SizedBox(height: 8),
                  ViewDownloadRow(
                    onView: onView,
                    onDownload: onDownload,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
