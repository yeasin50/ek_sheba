import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:patch_pal/patch_pal.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'src/ek_sheba_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await PatchPal.init('https://raw.githubusercontent.com/yeasin50/AssetsFor_/master/apps/patch_pal/ek_sheba.json');
  await TokenManager.setUp();
  setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('bn')],
      path: 'assets/translations',
      startLocale: const Locale('bn'),
      fallbackLocale: const Locale('bn'),
      child: const _Patcher(),
    ),
  );
}

class _Patcher extends StatelessWidget {
  const _Patcher({super.key});

  @override
  Widget build(BuildContext context) {
    final item = PatchPal.getItem('patchedEnabled');

    if (item?.value == true) {
      return const EkSheba();
    } else {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('This feature is not available right now.'),
          ),
        ),
      );
    }
  }
}
