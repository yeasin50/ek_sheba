import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/icon_button.dart';
import '../../../pdf/domain/entities/entities.dart';
import '../../../pdf/presentation/pages/pdf_page.dart';
import '../../domain/entities/project_details.dart';

// this page is used on  [ProjectDetailsPage]
class ProjectDownloadOptions extends StatelessWidget {
  const ProjectDownloadOptions({
    super.key,
    required this.project,
  });

  final ProjectDetails project;

  @override
  Widget build(BuildContext context) {
    final List<PDFButton> items =
        project.projectType.nameEn.toLowerCase() == "DPP".toLowerCase()
            ? dppPdfButtons
            : tappButtons;

    const String testUUId = '5119f081-55a1-48cb-a046-fb65e48d2f7f';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                onTap: () {}, icon: Icons.chat, label: "মন্তব্য / পর্যবেক্ষণ"),
          ],
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < (items.length / 2); i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                _BuildDownOptionCard(
                  title: items[i].title,
                  onTap: () {
                    final path = "${items[i].path}${project.uuid}";
                    context.push(PDFPage.routeName, extra: path);
                  },
                ),
                const SizedBox(width: 4),
                _BuildDownOptionCard(
                  title: items[6 + i].title,
                  onTap: () {
                    final path = "${items[6 + i].path}${project.uuid}";
                    context.push(PDFPage.routeName, extra: path);
                  },
                ),
              ],
            ),
          ),
        const SizedBox(height: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF61AB9E),
          ),
          onPressed: () {},
          child: const Text("সম্ভাব্যতা যাচাই প্রতিবেদন ডাউনলোড করুন"),
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
