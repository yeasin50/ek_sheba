import '../../../../locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../bloc/guideline/guideline_bloc.dart';
import '../widgets/widgets.dart';
import 'guideline_loaded_view.dart';

class GuideLinePage extends StatelessWidget {
  const GuideLinePage({super.key});
  static const routeName = '/guideLinePage';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          const MinimalAppBar(title: 'Guideline'),
          Expanded(
            child: BlocBuilder<GuidelineBloc, GuidelineState>(
              bloc: locator.get<GuidelineBloc>()..add(const GuidelineFetchEvent()),
              builder: (context, state) {
                if (state is GuidelineLoading) {
                  return defaultLoadingIndication;
                } else if (state is GuidelineError) {
                  return Center(child: Text(state.message));
                } else if (state is GuidelineLoaded) {
                  return OnGuidelineLoadView(loadedState: state);
                } else {
                  return Text("NA State $state");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
