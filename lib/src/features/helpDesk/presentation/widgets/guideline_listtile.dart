import '../../../../common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/guideline_info.dart';

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

    final downloadTextStyle = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppStyle.textWhite,
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
                  Row(
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
