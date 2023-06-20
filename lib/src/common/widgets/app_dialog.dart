import 'package:easy_localization/easy_localization.dart';
import 'package:ek_sheba/src/common/app_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

Future<void> showSampleDialog({
  required BuildContext context,
  required String message,
  bool hasLoading = false,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasLoading) ...[
            LoadingAnimationWidget.hexagonDots(
              color: AppStyle.buttonGreen,
              size: 64,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            message.tr().toString(),
            textAlign: TextAlign.center,
          ),
        ],
      ));
    },
  );
}
