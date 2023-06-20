import 'package:flutter/material.dart';

import '../app_images.dart';

///decoration for the app background
class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    super.key,
    required this.body,
  });

  final Widget body;

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
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: body,
            ),
          );
        },
      ),
    );
  }
}
