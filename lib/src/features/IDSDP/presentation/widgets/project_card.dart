import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/card_decoration.dart';

///this represents a project short description card in Dashboard details page
///holds `SL`, `project description`, `total cost`
class ProjectPlanInfoCard extends StatelessWidget {
  const ProjectPlanInfoCard({
    super.key,
    required this.sl,
    required this.projectDetails,
    required this.onTap,
  });

  final ProjectDetails projectDetails;
  final int sl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final filedTextStyle = TextStyle(color: AppStyle.textGreen);
    final titleTextStyle =
        TextStyle(color: AppStyle.buttonGreen, fontWeight: FontWeight.w600);

    var expanded = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: string2Raw(projectDetails.titleEn),
                      style: titleTextStyle),
                  TextSpan(
                      text: " (${projectDetails.projectType.nameEn})",
                      style: filedTextStyle.copyWith(color: Color(0xFF6C95BA))),
                ],
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Sector Division: '),
                TextSpan(
                    text: projectDetails.ministryDivision.nameEn,
                    style: filedTextStyle),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Commencement Date: '),
                TextSpan(
                    text: projectDetails.commencementDate,
                    style: filedTextStyle),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Completion Date: '),
                TextSpan(
                    text: projectDetails.completionDate, style: filedTextStyle),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Status: '),
                TextSpan(
                    text: projectDetails.status.replaceAll("_", " "),
                    style: filedTextStyle.copyWith(
                        color: Color(0xFFEF8C23), fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: CardDecoration(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildSL(), expanded, buildAmount()],
          ),
        ),
      ),
    );
  }

  SizedBox buildSL() {
    const slWidth = 30.0;

    return SizedBox(
        width: slWidth,
        child: Text(
          '$sl',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget buildAmount() {
    const totalCostWidth = 95.0;
    return SizedBox(
      width: totalCostWidth,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              ' ${projectDetails.totalAmount.toDouble()}',
              style: const TextStyle(color: AppStyle.buttonGreen),
            ),
          ],
        ),
      ),
    );
  }
}
