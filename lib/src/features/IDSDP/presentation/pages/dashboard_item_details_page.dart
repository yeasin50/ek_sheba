import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/widgets/label_decorator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/widgets/custom_appbar.dart';
import '../widgets/dashboard_listview.dart';
import '../widgets/project_location_map_card.dart';

class DashBoardItemDetailsPage extends StatelessWidget {
  const DashBoardItemDetailsPage({
    super.key,
    required this.itemTitle,
  });

  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    debugPrint(itemTitle);
    final label = Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Project $itemTitle",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    return BackgroundDecoration(
      body: ListView(
        children: [
          const IDSDPAppBar(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProjectLocationMapCard(),
                SizedBox(height: 24),
                label,
                SizedBox(height: 12),
                DashboardListView(
                  itemTitle: itemTitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
