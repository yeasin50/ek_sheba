import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../locator.dart';
import '../../data/datasources/home_button_datasource.dart';
import '../../data/models/button_info.dart';
import '../bloc/agency_and_ministry__name/agency_and_ministry_name_bloc.dart';
import '../bloc/idsdp_bloc.dart';
import '../widgets/idsdp_card.dart';
import 'dashboard_page.dart';

//home page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IdsdpBloc>(context).add(LoadProjectsEvent());
    locator.get<AgencyAndMinistryNameBloc>().add(const GetAgencyAndMinistryName());
  }

  @override
  Widget build(BuildContext context) {
    void onCardTap(ButtonInfo e, int i) {
      if (i == 0) {
        context.push(DashboardPage.routeName, extra: {
          'itemTitle': e.title,
        });
      }
    }

    return BackgroundDecoration(
      hasDrawer: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(hasDrawer: true),
            const SizedBox(height: 40),
            ...homeButtons
                .mapIndexed(
                  (i, e) => IDSDPCard(
                    buttonInfo: e,
                    onTap: () => onCardTap(e, i),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
