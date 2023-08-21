import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter/material.dart';

///this represents a project short description card in Dashboard details page
///holds `SL`, `project description`, `total cost`
class ProjectPlanInfoCard extends StatelessWidget {
  const ProjectPlanInfoCard({
    super.key,
    required this.projectDetails,
  });

  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          string2Raw(projectDetails.titleEn) ?? "NA",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
