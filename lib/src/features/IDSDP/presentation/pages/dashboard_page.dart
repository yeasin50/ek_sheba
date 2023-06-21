import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../widgets/approved_project_card.dart';
import '../widgets/project_location_map_card.dart';
import '../widgets/unapproved_project_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundDecoration(
      hasDrawer: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            IDSDPAppBar(
              hasDrawer: true,
              hasHomeButton: true,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProjectLocationMapCard(),
                  SizedBox(height: 24),
                  ApprovedProjectCard(),
                  SizedBox(height: 24),
                  UnApprovedProjectCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
