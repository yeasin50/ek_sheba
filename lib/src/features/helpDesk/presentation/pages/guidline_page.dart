import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../data/datasources/guideline_temp_db.dart';
import '../widgets/widgets.dart';

class GuideLinePage extends StatelessWidget {
  const GuideLinePage({super.key});
  static const routeName = '/guideLinePage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(
            title: 'Guideline',
            onBackButtonPressed: () {},
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GuideLineOptions(
                    titles: const [
                      'Project Processing, Appraisal & Management (PPS)',
                      'National Plan Management System (NPM)',
                      'Research Management System (RMS)',
                      'GIS Based Resource Management System (GRM)',
                    ],
                    onTap: (index) {},
                  ),
                ),
                ...tempGuidelinesInfo.mapIndexed((index, element) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GuideLineListTile(
                      guideLineInfo: element,
                      onView: () {},
                      onDownload: () {},
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
