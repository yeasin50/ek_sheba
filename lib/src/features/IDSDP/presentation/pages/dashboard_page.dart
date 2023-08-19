import 'package:flutter/material.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../locator.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import '../widgets/approved_project_card.dart';
import '../widgets/project_location_map_card.dart';
import '../widgets/unapproved_project_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    locator<DashboardProjectRepoImpl>().loadProjects().then((value) {
      setState(() {
        isLoading = false;
      });

      value.fold(
        (l) async {
          await showSampleDialog(context: context, message: "Failed to load data. Please try system account.");
        },
        (r) {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      hasDrawer: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(
              hasDrawer: true,
              hasHomeButton: true,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: isLoading
                    ? [defaultLoadingIndication]
                    : const [
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
