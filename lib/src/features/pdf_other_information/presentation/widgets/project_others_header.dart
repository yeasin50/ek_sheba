import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';

enum ProjectOtherInfoType {
  otherInformation(
    category: "Other Information",
    titleBn: "অন্যান্য তথ্য",
    title: "Title",
  ),
  relatedMeetingAttachments(
    category: "Related Meeting Attachments",
    titleBn: "সংশ্লিষ্ট মিটিং এর সংযুক্তি সমূহ",
    title: "Subject",
  );

  const ProjectOtherInfoType({
    required this.category,
    required this.titleBn,
    required this.title,
  });

  final String category;
  final String titleBn;
  final String title;
}

/// Build project other information header on Project Details page
///
class ProjectOtherInfoHeader extends StatelessWidget {
  const ProjectOtherInfoHeader({
    Key? key,
    required this.type,
    this.isBN = false,
  }) : super(key: key);

  final ProjectOtherInfoType type;
  final bool isBN;

  @override
  Widget build(BuildContext context) {
    final title = isBN ? type.titleBn : type.title;
    const slWidth = 30.0;
    const totalCostWidth = 95.0;

    final headerTextStyles = GoogleFonts.poppins(
      color: AppStyle.textWhite,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type.category, style: theme.textTheme.titleMedium),
        SizedBox(height: 8),
        Material(
          elevation: 2,
          color: AppStyle.buttonGreen,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: slWidth,
                  child: Text("SL", style: headerTextStyles),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: headerTextStyles,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: totalCostWidth,
                  child: Text(
                    "Download",
                    style: headerTextStyles,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
