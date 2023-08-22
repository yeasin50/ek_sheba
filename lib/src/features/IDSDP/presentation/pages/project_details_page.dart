import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/project_download_option.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/project_summary_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/icon_button.dart';
import '../../../../locator.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/project_location_map_card.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({Key? key, required this.projectDetails}) : super(key: key);

  final ProjectDetails projectDetails;

  static const routeName = '/project-details';

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  late Future<ProjectDetails?> future;

  late ProjectDetails projectDetails;

  @override
  void initState() {
    super.initState();
    projectDetails = widget.projectDetails;
    future = locator.get<DashboardProjectRepoImpl>().getProjectDetails(widget.projectDetails.uuid);

    //skipping futureBuilder for now,while we already have some data
    future.then((value) {
      if (value != null) {
       
          projectDetails = value;
        setState(() { });
        logger.i('projectDetails: ${projectDetails.assignedOfficer}');
      }
    });
  }

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
                    const SizedBox(height: 24),
                    ProjectDownloadOptions(project: projectDetails),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
