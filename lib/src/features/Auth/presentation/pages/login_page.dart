import 'package:flutter/material.dart';

import '../../../../common/app_images.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.background),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    IDSDPAppBar(),
                    SizedBox(height: 40),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
