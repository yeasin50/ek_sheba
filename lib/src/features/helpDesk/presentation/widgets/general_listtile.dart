import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';
import 'view_download_row.dart';

///create a list tile with title, description and view and download button
class GeneralListTile extends StatelessWidget {
  const GeneralListTile({
    Key? key,
    required this.title,
    required this.description,
    this.onTap,
    this.onView,
    this.onDownload,
  }) : super(key: key);
  final String title;
  final String description;
  final VoidCallback? onTap;
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
                    title,
                    style: labelTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
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
