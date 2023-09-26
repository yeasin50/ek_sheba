import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter/material.dart';

class ProjectSummaryWidget extends StatelessWidget {
  const ProjectSummaryWidget({
    super.key,
    required this.projectDetails,
  });

  final ProjectDetails projectDetails;

  @override
  Widget build(BuildContext context) {
    logger.i('ProjectSummaryWidget: ${projectDetails.uuid}');

    const TextStyle textStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    Widget buildText(String text) {
      return Material(
        color: Color.fromARGB(214, 214, 211, 211),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(text, style: textStyle),
            ),
          ),
        ),
      );
    }

    Widget buildRow({required String title, String? value}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: buildText(title),
            ),
            SizedBox(width: 1),
            Expanded(flex: 3, child: buildText(value ?? 'Nan')),
          ],
        ),
      );
    }

    /// just use on   [buildProjectStatusRow]
    Widget buildSmallButtonText({
      required String? text,
      required VoidCallback? onTap,
    }) {
      const TextStyle smallTextStyle = TextStyle(
        fontSize: 12,
        color: Colors.white,
      );
      return GestureDetector(
        onTap: onTap,
        child: Material(
          color: AppStyle.buttonGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
            child: Text(
              text ?? "Nan",
              style: smallTextStyle,
            ),
          ),
        ),
      );
    }

    Widget buildProjectStatusRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: buildText("প্রকল্পের অবস্থা"),
          ),
          SizedBox(width: 1),
          Expanded(
            flex: 3,
            child: Material(
              color: Color.fromARGB(214, 214, 211, 211),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: buildSmallButtonText(
                            text: string2Raw(projectDetails.projectStatusBn),
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: buildSmallButtonText(
                            text: string2Raw(projectDetails.projectStageBn),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    if ((projectDetails.assignedOfficer ?? "").isNotEmpty) ...[
                      const SizedBox(height: 2),
                      // if (projectDetails.showAssignedOfficer == true)
                      Text(
                          "অফিসারের নাম: ${projectDetails.assignedOfficer ?? ""}"),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("প্রকল্পের সারসংক্ষেপ"),
        const SizedBox(height: 12),
        buildRow(
            title: 'প্রকল্পের নাম\n(ইংরেজি)',
            value: string2Raw(projectDetails.titleEn)),
        buildRow(
            title: 'প্রকল্পের নাম\n(বাংলা)',
            value: string2Raw(projectDetails.titleBn)),
        buildRow(
            title: 'প্রকল্পের ধরণ',
            value: string2Raw(projectDetails.projectType.nameBn)),
        buildRow(
            title: 'উদ্যোগী মন্ত্রণালয়/বিভাগ',
            value: string2Raw(projectDetails.ministryDivision.nameBn)),
        buildRow(
            title: 'সংস্থার নাম',
            value: string2Raw(projectDetails.agency.nameBn)),
        buildRow(
            title: 'সেক্টর বিভাগ',
            value: string2Raw(projectDetails.sector.nameBn)),
        buildRow(
            title: 'এডিপি সাবসেক্টর',
            value: string2Raw(projectDetails.subSector?.nameBn ?? 'Nan')),
        buildProjectStatusRow(),
        buildRow(
            title: 'বাস্তবায়নের সময়কাল',
            value:
                "${projectDetails.commencementDate} থেকে ${projectDetails.completionDate}"),
      ],
    );
  }
}
