import 'package:ek_sheba/src/common/widgets/app_button.dart';
import 'package:ek_sheba/src/common/widgets/icon_button.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/label_decorator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../widgets/dashboard_listview.dart';
import '../widgets/project_location_map_card.dart';

class DashBoardItemDetailsPage extends StatelessWidget {
  const DashBoardItemDetailsPage({
    super.key,
    required this.itemTitle,
  });

  static const String routeName = '/dashboard_item';
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    debugPrint(itemTitle);
    final label = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Project $itemTitle",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppIconButton(
          onTap: () {
            context.pop();
          },
          icon: Icons.arrow_back_ios,
          label: "Dashboard",
        )
      ],
    );

    return BackgroundDecoration(
      hasDrawer: true,
      body: ListView(
        // may shift to CustomScrollView
        children: [
          const IDSDPAppBar(
            hasDrawer: true,
            hasHomeButton: true,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ProjectLocationMapCard(),
                SizedBox(height: 24),
                label,
                SizedBox(height: 12),
                DashboardListView(itemTitle: itemTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
