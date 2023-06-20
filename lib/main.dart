import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'src/ek_sheba_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('bn')],
      path: 'assets/translations',
      startLocale: const Locale('bn'),
      fallbackLocale: const Locale('bn'),
      child: const EkSheba(),
    ),
  );
}
