import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_style.dart';

//used [ProjectDetailsPage]  to show how to use it
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onTap;

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    final downloadTextStyle = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppStyle.textWhite,
    );
    return Material(
      color: AppStyle.buttonGreenLight,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppStyle.textWhite,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: downloadTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
