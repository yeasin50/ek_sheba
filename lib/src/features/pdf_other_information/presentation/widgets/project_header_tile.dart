import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';

/// used to show title and download option
///
///
class ProjectOtherAttachmentTile extends StatelessWidget {
  const ProjectOtherAttachmentTile({
    Key? key,
    required this.title,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const slWidth = 30.0;
    const totalCostWidth = 95.0;
    final textStyle = GoogleFonts.poppins(
      color: AppStyle.textBlack,
      fontSize: 14,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        tileColor: AppStyle.lightGreen,
        onTap: onTap,
        leading: SizedBox(
          width: slWidth,
          child: Text(
            '$index',
          ),
        ),
        title: Text(
          title,
          style: textStyle,
        ),

        ///* download option
        trailing: Icon(
          Icons.download_rounded,
          color: Colors.green,
        ),
      ),
    );
  }
}
