import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../widgets/widgets.dart';

class HelpLinePage extends StatelessWidget {
  const HelpLinePage({super.key});
  static const routeName = '/helpLinePage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MinimalAppBar(
            title: 'Help Line',
            onBackButtonPressed: () {},
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 40,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
    );
  }
}
