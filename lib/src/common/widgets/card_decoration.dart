import 'package:flutter/material.dart';

import '../app_style.dart';

class CardDecoration extends StatelessWidget {
  const CardDecoration({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.textWhite,
        boxShadow: AppStyle.boxShadow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withAlpha(75), width: 1),
      ),
      child: child,
    );
  }
}
