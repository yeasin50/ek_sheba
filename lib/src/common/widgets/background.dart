import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import 'app_drawer.dart';

///decoration for the app background
class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({
    super.key,
    required this.body,
    this.hasDrawer = false,
  });

  final Widget body;
  final bool hasDrawer;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.background.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              drawer: hasDrawer ? const AppDrawer() : null,
              backgroundColor: Colors.transparent,
              body: body,
            ),
          );
        },
      ),
    );
  }
}
