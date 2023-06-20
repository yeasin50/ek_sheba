import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'routes.dart';

class EkSheba extends StatelessWidget {
  const EkSheba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerConfig: routes,
    );
  }
}
