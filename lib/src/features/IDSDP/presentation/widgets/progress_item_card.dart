import '../../../../common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//used on dashboard page
class ProgressItemCard extends StatelessWidget {
  const ProgressItemCard({
    super.key,
    required this.title,
    required this.count,
    this.color,
    this.textColor,
    this.onTap,
    this.extraHeight = 0,
  });
  final String title;
  final int count;
  //default color is white
  final Color? color;
  //default color is black
  final Color? textColor;

  final double extraHeight;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppStyle.textWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppStyle.boxShadow,
        border: Border.all(
          color: color?.withAlpha(75) ?? Colors.black.withAlpha(40),
          width: 1,
        ),
      ),
      child: SizedBox(
        height: 80 + extraHeight,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: textColor ?? AppStyle.textBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        count.toString().padLeft(2, '0'),
                        style: GoogleFonts.poppins(
                          color: textColor ?? AppStyle.textBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
