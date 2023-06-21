import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelDecoratorWidget extends StatelessWidget {
  const LabelDecoratorWidget({
    Key? key,
    required this.text,
    this.color = AppStyle.buttonGreen,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  ///default color is AppStyle.buttonGreen
  final Color? color;

  final String text;

  final TextStyle? textStyle;

  ///default padding is EdgeInsets.all(4.0)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppStyle.buttonGreen,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: textStyle ??
              GoogleFonts.poppins(
                color: AppStyle.textWhite,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
