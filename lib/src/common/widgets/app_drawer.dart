import '../app_style.dart';
import '../utils/token_storage.dart';
import '../../features/IDSDP/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../features/IDSDP/presentation/pages/dpp_tapp_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final labelStyle = GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.1,
    );

    final textStyle = GoogleFonts.poppins(
      color: AppStyle.textBlack,
      fontSize: 14,
    );
    var preliminaryTile = ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.list_alt_rounded,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Preliminary Project Proposal",
              style: textStyle,
            ),
          ),
        ],
      ),
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.only(
              left: 16 + 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.list_alt_rounded,
                ),
                const SizedBox(width: 8),
                Text("Project $i", style: textStyle),
              ],
            ),
          )
      ],
    );

    var feasibilityStudyTile = ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.fact_check_outlined,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Feasibility Study",
              style: textStyle,
            ),
          ),
        ],
      ),
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: const EdgeInsets.only(
              left: 16 + 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                ),
                const SizedBox(width: 8),
                Text("Feasibility Study $i", style: textStyle),
              ],
            ),
          )
      ],
    );

    final dPPTAPPTile = ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.reorder_outlined,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "DPP/TAPP",
              style: textStyle,
            ),
          ),
        ],
      ),
      children: [
        InkWell(
          onTap: () {
            final currentRoute = GoRouter.of(context).location;
            if (currentRoute != DPPTAPPPage.routeName)
              context.push(DPPTAPPPage.routeName);
            else {
              Navigator.of(context).pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16 + 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_outline,
                ),
                const SizedBox(width: 8),
                Text("DPP/TAPP List", style: textStyle),
              ],
            ),
          ),
        )
      ],
    );

    final rdppRtapp = ExpansionTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.move_up_rounded,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "RDPP/RTAPP",
              style: textStyle,
            ),
          ),
        ],
      ),
      children: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16 + 16,
              top: 8,
              bottom: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.account_tree_rounded,
                ),
                const SizedBox(width: 8),
                Text("RDPP/RTAPP List", style: textStyle),
              ],
            ),
          ),
        )
      ],
    );

    var listView = ListView(
      children: [
        GestureDetector(
          onTap: () {
            //navigate to dashboard
            final currentRoute = GoRouter.of(context).location;
            if (currentRoute != DashboardPage.routeName) {
              context.push('/dashboard');
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Material(
            color: const Color.fromARGB(255, 32, 155, 132),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.now_widgets_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text("Dashboard", style: labelStyle),
                ],
              ),
            ),
          ),
        ),
        // preliminaryTile,
        // feasibilityStudyTile,
        dPPTAPPTile,
        // rdppRtapp,
      ],
    );
    return Drawer(
      //offwhite
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Expanded(
            child: listView,
          ),

          //logout
          Material(
            color: Color.fromARGB(255, 155, 87, 32),
            child: InkWell(
              onTap: () async {
                await TokenManager.deleteSecureToken();
                context.replace('/login');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Text("Logout", style: labelStyle),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
