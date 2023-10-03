import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/features/helpDesk/data/repositories/faq_repository_impl.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/raw_text.dart';
import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../bloc/faq/faq_bloc.dart';
import '../widgets/widgets.dart';

class FAQDetailsPage extends StatelessWidget {
  const FAQDetailsPage({
    super.key,
    required this.uuid,
  });

  final String uuid;

  static const routeName = '/faq_details';

  @override
  Widget build(BuildContext context) {
    logger.i(uuid);
    return BlocBuilder<FaqBloc, FaqState>(
      bloc: FaqBloc(locator.get<FAQRepositoryImpl>())
        ..add((OnFaqDetailsEvent(uuid))),
      builder: (context, state) {
        bool isLoading = state is FaqLoading;
        bool isError = state is FaqError;
        final itemsList = state is FaqLoaded ? state.faqList : null;
        final firstItem = itemsList?.firstOrNull;

        final title = firstItem != null
            ? firstItem.imsModuleName ?? firstItem.question ?? "FAQ Details"
            : "FAQ ....";
        return Builder(builder: (context) {
          return BackgroundDecoration(
            body: Column(
              children: [
                MinimalAppBar(title: title),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 40),
                    child: Column(
                      children: [
                        if (isLoading) ...[
                          Center(
                            child: defaultLoadingIndication,
                          ),
                        ],
                        if (isError) ...[
                          const Center(
                            child: Text(
                              "Failed to load FAQ",
                            ),
                          ),
                        ],
                        if (state is FaqLoaded && firstItem != null) ...[
                          Text(
                            firstItem.question ?? "Question",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            string2Raw(firstItem.answer) ?? "Answer",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ] else ...[
                          const Center(
                            child: Text(
                              "Could not found any FAQ data",
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
