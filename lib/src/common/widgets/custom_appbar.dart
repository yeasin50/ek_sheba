import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';

class IDSDPAppBar extends StatelessWidget {
  const IDSDPAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = GoogleFonts.poppins(
      color: AppStyle.textBlack,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.5,
    );

    final logo = Assets.images.govtLogo.image(
      width: 48,
      height: 48,
      fit: BoxFit.cover,
    );
    const space = SizedBox(width: 12);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEAF7F0),
            AppStyle.lightGreen,
          ],
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space,
            logo,
            space,
            Expanded(
              child: Text(
                "Integrated Digital Services Delivery Platform (IDSDP)\nPlanning Division & Planning Commission",
                style: textStyles,
              ),
            ),
            space,
          ],
        ),
      ),
    );
  }
}
