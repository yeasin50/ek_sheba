import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../widgets/widgets.dart';

class HelpLinePage extends StatelessWidget {
  const HelpLinePage({super.key});
  static const routeName = '/helpLinePage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const BackgroundDecoration(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MinimalAppBar(title: 'Help Line'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      HealLineFormWidget(),
                      SizedBox(height: 42),
                      HelpLineBottomInfo(),
                      SizedBox(height: 42),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
