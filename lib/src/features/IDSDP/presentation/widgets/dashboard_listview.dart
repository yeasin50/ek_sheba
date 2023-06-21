import 'package:ek_sheba/src/common/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      ],
    );
  }
}
