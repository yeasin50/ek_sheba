import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';

class HelpLineGridTile extends StatelessWidget {
  ///creates a grid tile with a text and a tap event
  ///if [isFilled] is true then the tile will be filled with [AppStyle.buttonGreenLight] color
  /// else it will be filled with [Colors.white]
  const HelpLineGridTile({
    super.key,
    required this.text,
    this.onTap,
    this.isFilled = true,
    this.fontSize = 14,
  });

  final String text;
  final VoidCallback? onTap;
  final bool isFilled;

  ///default is 14
  /// depends on FAQ(14) and Guideline(12) page
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final gridItemTextStyle = GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: isFilled ? FontWeight.w500 : FontWeight.w400,
      color: isFilled ? Colors.white : AppStyle.textBlack,
    );
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: isFilled ? AppStyle.buttonGreenLight : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: AppStyle.buttonGreenLight, width: 1),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Center(
              child: Text(
                text,
                style: gridItemTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
