import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';
import '../../domain/entities/guideline_info.dart';
import 'view_download_row.dart';

class GuideLineListTile extends StatelessWidget {
  const GuideLineListTile({
    super.key,
    required this.guideLineInfo,
    this.onView,
    this.onDownload,
  });

  final GuideLineInfo guideLineInfo;

  final VoidCallback? onView;
  final VoidCallback? onDownload;

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
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    guideLineInfo.title,
                    style: labelTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    guideLineInfo.description,
                    style: descriptionTextStyle,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 8),
                  ViewDownloadRow(
                    onView: onView,
                    onDownload: onDownload,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
