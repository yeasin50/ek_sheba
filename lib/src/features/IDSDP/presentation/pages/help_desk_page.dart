import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/minimal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            onBackButtonPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 48,
              horizontal: 24,
            ),
            child: ListTileTheme(
              data: ListTileThemeData(
                minLeadingWidth: 36,
                titleTextStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF282020),
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
                    title: Text('FAQ'),
                    onTap: () {},
                    leading: Icon(Icons.info_outline),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: Text('Guideline'),
                    onTap: () {},
                    leading: Icon(Icons.file_download_outlined),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: Text('Resources'),
                    onTap: () {},
                    leading: Icon(Icons.language_rounded),
                    trailing: trailingIcon,
                  ),
                  // Notice Panel
                  ListTile(
                    title: Text('Notice Panel'),
                    onTap: () {},
                    leading: Icon(Icons.info_outline),
                    trailing: trailingIcon,
                  ),
                  ListTile(
                    title: Text('Help Line'),
                    onTap: () {},
                    leading: Icon(Icons.headphones_outlined),
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
