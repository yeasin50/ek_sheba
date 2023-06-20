import 'package:easy_localization/easy_localization.dart';
import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isFilled,
    this.largeButton = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isFilled;

  ///when height is 42
  final bool largeButton;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        backgroundColor: isFilled ? AppStyle.buttonGreen : Colors.white,
        minimumSize: largeButton ? const Size(double.infinity, 42) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: const BorderSide(
          color: AppStyle.buttonGreen,
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          text.tr().toString(),
          style: TextStyle(
            color: isFilled ? Colors.white : AppStyle.buttonGreen,
          ),
        ),
      ),
    );
  }
}
