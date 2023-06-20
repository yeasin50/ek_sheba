import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routes.dart';

class EkSheba extends StatelessWidget {
  const EkSheba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerConfig: routes,
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          iconTheme: IconThemeData(
            color: AppStyle.outlineColor,
          )),
    );
  }
}
