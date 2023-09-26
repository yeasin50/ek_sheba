import '../../../../common/app_style.dart';
import 'notice_plan_page.dart';
import 'pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/minimal_appbar.dart';

class HelpDeskPage extends StatelessWidget {
  const HelpDeskPage({super.key});

  @override
  Widget build(BuildContext context) {
    const trailingIcon = Icon(
      Icons.arrow_forward_ios,
      color: Color(0xFF282020),
    );

    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(
            title: 'HelpDesk',
            onBackButtonPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 24,
            ),
            child: ListTileTheme(
              data: ListTileThemeData(
                minLeadingWidth: 36,
                titleTextStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppStyle.textBlack,
                ),
                contentPadding: EdgeInsets.zero,
                // dense: true,
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('FAQ'),
                    onTap: () {
                      context.push('/faq');
                    },
                    leading: const Icon(Icons.info_outline),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('Guideline'),
                    onTap: () {
                      context.push('/guideLinePage');
                    },
                    leading: const Icon(Icons.file_download_outlined),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('Resources'),
                    onTap: () {
                      context.push('/resource');
                    },
                    leading: const Icon(Icons.language_rounded),
                    trailing: trailingIcon,
                  ),
                  // Notice Panel
                  ListTile(
                    title: const Text('Notice Panel'),
                    onTap: () {
                      context.push(NoticePlanPage.routeName);
                    },
                    leading: const Icon(Icons.info_outline),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: const Text('Help Line'),
                    onTap: () {
                      context.push(HelpLinePage.routeName);
                    },
                    leading: const Icon(Icons.headphones_outlined),
                    trailing: trailingIcon,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
