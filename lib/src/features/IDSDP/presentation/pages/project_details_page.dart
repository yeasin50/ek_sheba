import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/project_summary_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/icon_button.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/project_location_map_card.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({Key? key, required this.projectDetails}) : super(key: key);

  final ProjectDetails projectDetails;

  static const routeName = '/project-details';

  @override
  Widget build(BuildContext context) {
    final sectorDivision = string2Raw(projectDetails.sectorDivision.nameEn);
    return Scaffold(
      body: BackgroundDecoration(
        hasDrawer: true,
        body: ListView(
          children: [
            const IDSDPAppBar(
              hasDrawer: true,
              hasHomeButton: true,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (sectorDivision != null) ProjectLocationMapCard(title: sectorDivision),
                    const SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(),
                        AppIconButton(
                          onTap: () {},
                          icon: Icons.forward_to_inbox,
                          label: 'Download',
                        ),
                        const SizedBox(width: 8),
                        AppIconButton(
                          onTap: () {},
                          icon: Icons.compare_arrows_rounded,
                          label: 'Compare',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ProjectSummaryWidget(projectDetails: projectDetails),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
