import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:fpdart/fpdart.dart';

import 'package:my_utils/my_utils.dart';

import '../../../../common/app_style.dart';
import '../../data/models/project_type.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';

import '../../../../locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/entities/project_details.dart';
import 'project_card.dart';

/// DashboardItems
/// returns a list of items for the dashboard using [Column] widget
class DashboardListView extends StatelessWidget {
  const DashboardListView({super.key, required this.itemTitle});

  final String itemTitle;
  @override
  Widget build(BuildContext context) {
    const slWidth = 30.0;
    const totalCostWidth = 95.0;

    final headerTextStyles = GoogleFonts.poppins(
      color: AppStyle.textWhite,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final header = Material(
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
    return Column(
      children: [
        header,
        getItem(itemTitle),
      ],
    );
  }
}

Widget getItem(String title) {
  final type = projectTypeFromTitle(title);
  final future = locator.get<DashboardProjectRepoImpl>().fromType(type);

  return FutureBuilder<List<ProjectDetails>>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        logger.e('getItem: ${snapshot.error.toString()}');
        return const Center(child: Text('Something went wrong'));
      }

      if (snapshot.hasData) {
        logger.d('getItem: ${snapshot.data}');

        return Column(
          children: snapshot.data != null
              ? snapshot.data!
                  .map(
                    (e) => ProjectPlanInfoCard(
                      projectDetails: e,
                    ),
                  )
                  .toList()
              : [],
        );
      }

      return const Center(child: Text('NA state'));
    },
  );
}
