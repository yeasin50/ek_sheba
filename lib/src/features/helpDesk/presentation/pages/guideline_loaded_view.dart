import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/utils.dart';
import '../../../../common/widgets/app_dialog.dart';
import '../../../../locator.dart';
import '../bloc/guideline/guideline_bloc.dart';
import '../widgets/widgets.dart';

class OnGuidelineLoadView extends StatelessWidget {
  const OnGuidelineLoadView({
    super.key,
    required this.loadedState,
  });

  final GuidelineLoaded loadedState;

  @override
  Widget build(BuildContext context) {
    final guidelines = loadedState.guidelines;

    final titles =
        guidelines.map((e) => e.moduleName ?? e.imsModuleName ?? "NA").toList();
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
              locator
                  .get<GuidelineBloc>()
                  .add(GuidelineSelectEvent(imsModuleId: ids[index]));
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
                onTap: null,
                onView: () {
                  context.push(
                    '/pdf_view',
                    extra: {
                      'uid': element.uuid,
                      "url": element.attachmentUrl,
                      "title": element.title,
                    },
                  );
                },
                onDownload: () {},
              ),
            );
          }),
      ],
    );
  }
}
