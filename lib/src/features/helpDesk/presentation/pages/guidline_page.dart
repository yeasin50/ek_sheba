import 'package:collection/collection.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../bloc/guideline/guideline_bloc.dart';
import '../widgets/widgets.dart';

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
                  return _OnGuidelineLoadView(loadedState: state);
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

class _OnGuidelineLoadView extends StatelessWidget {
  const _OnGuidelineLoadView({
    super.key,
    required this.loadedState,
  });

  final GuidelineLoaded loadedState;

  @override
  Widget build(BuildContext context) {
    final guidelines = loadedState.guidelines;

    final titles = guidelines.map((e) => e.moduleName ?? e.imsModuleName ?? "NA").toList();
    final ids = guidelines.map((e) => e.uuid).toList();
    final guidelineList = loadedState.guidelineList ?? [];

    return ListView(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GuideLineOptions(
            titles: titles,
            selectedIndex: ids.indexOf(loadedState.selectedGuidelineId),
            onTap: (index) {
              locator.get<GuidelineBloc>().add(GuidelineSelectEvent(imsModuleId: ids[index]));
            },
          ),
        ),
        if (loadedState.isListLoading) ...[
          const SizedBox(height: 40),
          Center(child: defaultLoadingIndication),
        ] else if (guidelineList.isEmpty) ...const [
          SizedBox(height: 40),
          Center(child: Text("No guideline found")),
        ] else
          ...guidelineList.mapIndexed((index, element) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GeneralListTile(
                title: element.title ?? "Null",
                description: element.description ?? "Null",
                onTap: () {},
                onView: () {},
                onDownload: () {},
              ),
            );
          }),
      ],
    );
  }
}
