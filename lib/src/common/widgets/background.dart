import 'package:flutter/material.dart';

import '../app_style.dart';

///decoration for the app background
class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          AppStyle.lightGreen,
        ],
      ),
    );
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          height: 132,
          child: DecoratedBox(
            decoration: boxDecoration,
          ), 
        ),
        child,
      ],
    );
  }
}
