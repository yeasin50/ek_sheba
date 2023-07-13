import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../app_style.dart';

class LoadingOverlay {
  LoadingOverlay({
    required this.message,
    this.hasLoading = false,
  });

  OverlayEntry? _overlay;
  final String message;
  final bool hasLoading;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => AlertDialog(
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
        )),
      );
      if (_overlay != null) {
        Overlay.of(context).insert(_overlay!);
      }
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}
