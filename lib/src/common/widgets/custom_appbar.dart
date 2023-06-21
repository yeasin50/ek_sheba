import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../gen/assets.gen.dart';

class IDSDPAppBar extends StatelessWidget {
  const IDSDPAppBar({
    super.key,
    this.hasDrawer = false,
    this.hasHomeButton = false,
  });

  final bool hasDrawer;
  final bool hasHomeButton;
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
      decoration: AppStyle.appBarDecoration,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasDrawer)
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
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
            if (hasHomeButton)
              IconButton(
                onPressed: () {
                  context.replace('/');
                },
                icon: const Icon(Icons.home),
              ),
          ],
        ),
      ),
    );
  }
}
