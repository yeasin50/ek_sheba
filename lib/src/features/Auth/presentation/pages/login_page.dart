import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../locator.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var blocListener = BlocConsumer<AuthBloc, AuthState>(
      bloc: locator<AuthBloc>(),
      listener: (context, state) async {
        logger.d(state);
        if (state is AuthLoading) {
          await showSampleDialog(
            context: context,
            message: "pleaseWait",
            hasLoading: true,
          );
        } else if (state is AuthFailureState) {
          Navigator.of(context).pop();
          await showSampleDialog(
            context: context,
            message: state.message,
          );
        } else if (state is AuthSuccess) {
          Navigator.of(context).pop();
          context.go('/');
        }
      },
      builder: (context, state) {
        return const LoginForm();
      },
    );
    return BackgroundDecoration(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(),
            const SizedBox(height: 40),
            blocListener,
          ],
        ),
      ),
    );
  }
}
