import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundDecoration(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IDSDPAppBar(),
            SizedBox(height: 40),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
