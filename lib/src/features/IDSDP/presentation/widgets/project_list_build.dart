import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';
import '../../domain/entities/project_details.dart';
import '../pages/project_details_page.dart';
import 'project_card.dart';

class ProjectListBuild extends StatelessWidget {
  const ProjectListBuild({
    super.key,
    required this.projectDetails,
  });

  final List<ProjectDetails> projectDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _BuildHeader(),
        const SizedBox(height: 8),
        ...projectDetails
            .mapIndexed(
              (sl, e) => ProjectPlanInfoCard(
                sl: sl + 1,
                projectDetails: e,
                onTap: () {
                  if (context.mounted) {
                    context.push(ProjectDetailsPage.routeName, extra: e);
                  }
                },
              ),
            )
            .toList(),
      ],
    );
  }
}

 

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const slWidth = 30.0;
    const totalCostWidth = 95.0;

    final headerTextStyles = GoogleFonts.poppins(
      color: AppStyle.textWhite,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    return Material(
      elevation: 2,
      color: AppStyle.buttonGreen,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: slWidth,
              child: Text("SL", style: headerTextStyles),
            ),
            Expanded(
              child: Text(
                "Project Information",
                style: headerTextStyles,
              ),
            ),
            SizedBox(
              width: totalCostWidth,
              child: Text(
                "Project Cost",
                style: headerTextStyles,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
