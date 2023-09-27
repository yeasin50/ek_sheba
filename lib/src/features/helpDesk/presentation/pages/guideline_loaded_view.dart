import 'package:collection/collection.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../locator.dart';
import '../../../pdf/data/repositories/pdf_repo_impl.dart';
import '../../../pdf/presentation/pages/pdf_page.dart';
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
            final path = "https://gwtraining.plandiv.gov.bd/api/${element.attachmentUrl}";

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GeneralListTile(
                title: element.title ?? "Null",
                description: element.description ?? "Null",
                onTap: null,
                onView: () {
                  context.push(
                    PDFPage.routeName,
                    extra: {
                      "path": path,
                      "title": element.attachmentName,
                      'isTokenRequired': false,
                    },
                  );
                },
                onDownload: () async {
                  final data = await PdfRepositoryImpl.loadPDF(path, null);
                  if (data == null) {
                    logger.e('data is null');
                    return;
                  }
                  await PdfRepositoryImpl.downloadPDF(data, element.attachmentName ?? "Null");
                },
              ),
            );
          }),
      ],
    );
  }
}
