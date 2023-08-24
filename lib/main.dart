import 'package:ek_sheba/src/locator.dart';
import 'package:expirable/expirable.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'src/ek_sheba_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('bn')],
      path: 'assets/translations',
      startLocale: const Locale('bn'),
      fallbackLocale: const Locale('bn'),
      child: Expirable(
        expireDate: DateTime(2023, 9, 1),
        message: "Contact the developer for new version",
        child: const EkSheba(),
      ),
    ),
  );
}
