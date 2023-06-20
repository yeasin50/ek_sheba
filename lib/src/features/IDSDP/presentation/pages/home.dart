import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';

//home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IDSDPAppBar(),
          ],
        ),
      ),
    );
  }
}
