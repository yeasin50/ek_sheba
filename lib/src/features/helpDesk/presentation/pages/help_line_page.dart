import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:ek_sheba/src/features/helpDesk/presentation/widgets/help_line_form.dart';
import 'package:ek_sheba/src/features/helpDesk/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 40,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HealLineFormWidget(),
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
