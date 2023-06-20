import 'package:easy_localization/easy_localization.dart';
import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isEkSheba = true;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(); //also used on username
  final _passwordController = TextEditingController();

  void _toggleLoginType() {
    setState(() {
      isEkSheba = !isEkSheba;
    });
  }

  bool isPasswordVisible = false;
  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool isRememberMe = false;
  void _toggleRememberMe(value) {
    setState(() {
      isRememberMe = !isRememberMe;
    });
  }

  void _onForgetPasswordPressed() {}

  void _helpDesk() {}

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 16);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "ek-sheba",
                    onPressed: _toggleLoginType,
                    isFilled: isEkSheba == true,
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: AppButton(
                    text: "SystemAdmin",
                    onPressed: _toggleLoginType,
                    isFilled: isEkSheba == false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 42),
            ..._buildTextField(
              controller: _emailController,
              hintText: isEkSheba ? "UserID" : "email",
            ),
            space,
            ..._buildTextField(
              controller: _passwordController,
              hintText: 'Password',
              onSuffixIconPressed: _togglePasswordVisibility,
            ),
            space,

            //remember me + forgot password
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: isRememberMe,
                    onChanged: _toggleRememberMe,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _onForgetPasswordPressed,
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(fontSize: 14, color: AppStyle.textGreen),
                  ),
                ),
              ],
            ),
            space,
            GestureDetector(
              onTap: _helpDesk,
              child: Row(
                children: [
                  const Icon(Icons.help_outline_outlined),
                  const SizedBox(width: 8),
                  Text("HelpDesk".tr()),
                ],
              ),
            ),

            SizedBox(height: 32),

            //login button
            AppButton(
              text: "Sign in",
              isFilled: true,
              largeButton: true,
              onPressed: _onSignInPressed,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTextField({
    required TextEditingController controller,
    required String hintText,
    VoidCallback? onSuffixIconPressed,
  }) {
    return [
      Text(
        hintText.tr().toString(),
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 42,
        child: TextFormField(
          controller: controller,
          obscureText: hintText == "Password" ? !isPasswordVisible : false,
          decoration: InputDecoration(
            suffixIcon: hintText == "Password"
                ? IconButton(
                    splashRadius: 16,
                    onPressed: onSuffixIconPressed,
                    icon: Icon(isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                  )
                : const Icon(Icons.email_outlined),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return (isEkSheba ? "UserID" : "emailAddress").tr().toString() + " " + "cannotBeEmpty".tr().toString();
          //   }
          //   return null;
          // },
        ),
      ),
    ];
  }

  void _onSignInPressed() {}
}
