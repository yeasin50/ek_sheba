import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../widgets/guideline_options.dart';
import '../widgets/minimal_appbar.dart';

class GuideLinePage extends StatelessWidget {
  const GuideLinePage({super.key});
  static const routeName = '/guideLinePage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: ListView(
        children: [
          MinimalAppBar(
            title: 'Guideline',
            onBackButtonPressed: () {},
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GuideLineOptions(
              titles: const [
                'Project Processing, Appraisal & Management (PPS)',
                'National Plan Management System (NPM)',
                'Research Management System (RMS)',
                'GIS Based Resource Management System (GRM)',
              ],
              onTap: (index) {},
            ),
          )
        ],
      ),
    );
  }
}
