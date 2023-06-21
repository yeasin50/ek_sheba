import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';

/// used to view and download resource on callback
/// used on [GuideLineListTile] and [ResourceCard]
class ViewDownloadRow extends StatelessWidget {
  const ViewDownloadRow({
    super.key,
    required this.onView,
    required this.onDownload,
  });

  final VoidCallback? onView;
  final VoidCallback? onDownload;

  @override
  Widget build(BuildContext context) {
    final downloadTextStyle = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppStyle.textWhite,
    );
    return Row(
      children: [
        Material(
          color: AppStyle.buttonGreenLight,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: onView,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Icon(
                Icons.remove_red_eye_outlined,
                color: AppStyle.textWhite,
                size: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Material(
          color: AppStyle.buttonGreenLight,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: onDownload,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.file_download_outlined,
                    color: AppStyle.textWhite,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Download',
                    style: downloadTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
