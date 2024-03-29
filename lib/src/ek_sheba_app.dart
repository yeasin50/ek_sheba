import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/IDSDP/presentation/bloc/agency_and_ministry__name/agency_and_ministry_name_bloc.dart';
import 'features/IDSDP/presentation/bloc/idsdp_bloc.dart';
import 'features/helpDesk/presentation/bloc/notice_plan/notice_plan_bloc.dart';
import 'routes.dart';

class EkSheba extends StatelessWidget {
  const EkSheba({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IdsdpBloc>(create: (context) => locator<IdsdpBloc>()),
        BlocProvider<AgencyAndMinistryNameBloc>(
            create: (context) => locator<AgencyAndMinistryNameBloc>()),
        BlocProvider<NoticePlanBloc>(
            create: (context) => locator.get<NoticePlanBloc>())
      ],
      child: Material(
        //to remove the transparent background on status bar
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          routerConfig: routes,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
              fontFamily: GoogleFonts.poppins().fontFamily,
              iconTheme: const IconThemeData(
                color: AppStyle.outlineColor,
              )),
        ),
      ),
    );
  }
}
