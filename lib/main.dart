import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'src/ek_sheba_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const EkSheba());
}
