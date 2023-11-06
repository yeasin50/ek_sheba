import 'package:flutter/material.dart';

import '../../../../common/utils/logger.dart';
import '../../../../common/utils/raw_text.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/icon_button.dart';
import '../../../../locator.dart';
import '../../../pdf_other_information/presentation/pages/project_others_info_and_related_meetinfs.dart';
import '../../../pdf_other_information/presentation/widgets/project_others_information_view.dart';
import '../../../pdf_other_information/presentation/widgets/project_related_meetings_view.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/project_download_option.dart';
import '../widgets/project_location_map_card.dart';
import '../widgets/project_summary_widget.dart';

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
  ProjectDetails? projectDetailsFromDB;

  @override
  void initState() {
    super.initState();
    projectDetails = widget.projectDetails;
    future = locator.get<DashboardProjectRepoImpl>().getProjectDetails(widget.projectDetails.uuid);
    logger.i(
        'projectDetails: ProjectDetailsPage ${projectDetails.assignedOfficer}  ${projectDetails.uuid} id ${projectDetails.id} ${projectDetails.projectMovementStageId} ${projectDetails.sourceId}');
    //skipping futureBuilder for now,while we already have some data
    future.then((value) {
      if (value == null) {
        logger.e(
            'projectDetails: details not found for uuid: ${widget.projectDetails.uuid} id: ${widget.projectDetails.id}');
      }
      if (value != null) {
        projectDetailsFromDB = value;

        setState(() {});
        logger.d(
            'projectDetails: data found>>  ${projectDetailsFromDB?.assignedOfficer} , projectMovementStageId: ${projectDetailsFromDB?.projectMovementStageId}  ');
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
                  key: const ValueKey('_ProjectDetailsPageState other pdf Column'),
                  children: [
                    const ProjectLocationMapCard(),
                    // downloadOption(),
                    const SizedBox(height: 24),
                    ProjectSummaryWidget(projectDetails: projectDetailsFromDB ?? projectDetails),
                    const SizedBox(height: 24),
                    ProjectDownloadOptions(project: projectDetailsFromDB ?? projectDetails),
                    const SizedBox(height: 24),
                    if (projectDetailsFromDB != null) ...[
                      // ProjectOtherPDFInformation(projectDetails: projectDetailsFromDB!),
                      ProjectOtherInformation(
                        id: "${projectDetailsFromDB?.id}",
                        projectType: projectDetailsFromDB!.projectType.nameEn,
                        isForeignAid: projectDetailsFromDB!.isForeignAid,
                      ),
                      const SizedBox(height: 24),
                      ProjectRelatedMeetingView(
                        isForeignAid: projectDetailsFromDB!.isForeignAid,
                        projectMovementStageId: projectDetailsFromDB!.projectMovementStageId.toString(),
                      )
                    ]
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget downloadOption() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    );
  }
}
