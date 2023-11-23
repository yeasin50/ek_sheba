import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/api_config.dart';
import '../../../../common/widgets/icon_button.dart';
import '../../../pdf/domain/entities/entities.dart';
import '../../../pdf/presentation/pages/pdf_page.dart';
import '../../domain/entities/project_details.dart';
import '../utils/comment_on_pdf_details.dart';
import '../utils/download_by_observation.dart';

// this page is used on  [ProjectDetailsPage]
class ProjectDownloadOptions extends StatelessWidget {
  const ProjectDownloadOptions({
    super.key,
    required this.project,
  });

  final ProjectDetails project;

  @override
  Widget build(BuildContext context) {
    bool isDPP = project.projectType.nameEn.toLowerCase() == "DPP".toLowerCase();

    final bool isBn = project.isForeignAid == false;

    late final List<PDFButton> items = isDPP ? dppPdfButtons : tappButtons;

    _comment() async {
      await comment(
        context: context,
        project: project,
      );
    }

    //FIXME: this is not working
    void _fullPDFDownload() {
      // dpp => {{BASE_URL_END_POINT}}/external/mobile-apps/get-dpp-report/full/{{pcUuid}}
      // tpp => {{BASE_URL_END_POINT}}/external/mobile-apps/get-tapp-report/full/{{pcUuid}}
      final path = "${isDPP ? DppPDFPath().full : TappPDF.full}${project.uuid}";
      context.push(
        PDFPage.routeName,
        extra: {
          "path": path,
          "title": isBn ? string2Raw(project.titleBn) : project.titleEn,
          "isTokenRequired": true,
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          text: isBn ? " সমগ্র ডিপিপি ডাউনলোড করুন" : "Download Full Report",
          onPressed: _fullPDFDownload,
          isFilled: true,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              "ডিপিপি প্রকল্পের অংশ ডাউনলোড করুন",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            AppIconButton(
              onTap: _comment,
              icon: Icons.chat,
              label: isBn ? "মন্তব্য / পর্যবেক্ষণ" : "Comments",
            ),
          ],
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < (items.length / 2); i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                _BuildDownOptionCard(
                  title: project.isForeignAid ? items[i].title : items[i].titleBn ?? items[i].title,
                  onTap: () {
                    final path = "${items[i].path}${project.uuid}";
                    context.push(
                      PDFPage.routeName,
                      extra: {
                        "path": path,
                        "title": project.isForeignAid ? items[i].title : items[i].titleBn ?? items[i].title,
                      },
                    );
                  },
                ),
                const SizedBox(width: 4),
                _BuildDownOptionCard(
                  title: project.isForeignAid ? items[6 + i].title : items[6 + i].titleBn ?? items[6 + i].title,
                  onTap: () {
                    final path = "${items[6 + i].path}${project.uuid}";
                    context.push(
                      PDFPage.routeName,
                      extra: {
                        "path": path,
                        "title": project.isForeignAid ? items[6 + i].title : items[6 + i].titleBn ?? items[6 + i].title,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF61AB9E),
          ),
          onPressed: () => downloadByObservation(
            context,
            project.uuid,
            isBn: isBn,
          ),
          child: const Text(
            "সম্ভাব্যতা যাচাই প্রতিবেদন ডাউনলোড করুন",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _BuildDownOptionCard extends StatelessWidget {
  const _BuildDownOptionCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 64,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFAAE5D0),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                    right: 2,
                  ),
                  child: Icon(
                    Icons.forward,
                    size: 12,
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
