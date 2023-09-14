import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';

import '../../../Auth/presentation/pages/login_page.dart';
import '../bloc/agency_and_ministry__name/agency_and_ministry_name_bloc.dart';
import '../bloc/idsdp_bloc.dart';
import '../widgets/approved_project_card.dart';
import '../widgets/project_location_map_card.dart';
import '../widgets/unapproved_project_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IdsdpBloc>(context).add(LoadProjectsEvent());
    locator.get<AgencyAndMinistryNameBloc>().add(const GetAgencyAndMinistryName());
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      hasDrawer: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const IDSDPAppBar(
              hasDrawer: true,
              hasHomeButton: true,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocBuilder<IdsdpBloc, IdsdpState>(
                builder: (context, state) {
                  if (state is IdsdpError) {
                    return Column(
                      children: [
                        Text(state.message),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<IdsdpBloc>(context).add(LoadProjectsEvent());
                          },
                          child: const Text('Retry'),
                        ),

                        Text('Or'),

                        //login
                        ElevatedButton(
                          onPressed: () async {
                            await TokenManager.deleteSecureToken();
                            if (context.mounted) context.pushReplacementNamed(LoginPage.routeName);
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    );
                  }

                  if (state is IdsdpLoaded) {
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProjectLocationMapCard(),
                        SizedBox(height: 24),
                        ApprovedProjectCard(),
                        SizedBox(height: 24),
                        UnApprovedProjectCard(),
                      ],
                    );
                  }
                  return Center(child: defaultLoadingIndication);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
