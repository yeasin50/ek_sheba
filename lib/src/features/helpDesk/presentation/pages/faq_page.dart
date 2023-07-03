import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/background.dart';
import '../../../../locator.dart';
import '../../domain/entities/faq_info.dart';
import '../bloc/faq/faq_bloc.dart';
import '../widgets/widgets.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          const MinimalAppBar(title: 'FAQ'),
          const SizedBox(height: 40),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchWidget(
                    onSearch: (value) {
                      if (value.isEmpty) {
                        locator<FaqBloc>().add(const FaqFetchEvent());
                      } else {
                        locator<FaqBloc>().add(FaqSearchEvent(value));
                      }
                    },
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: BlocBuilder<FaqBloc, FaqState>(
                      bloc: locator<FaqBloc>()..add(const FaqFetchEvent()),
                      builder: (context, state) {
                        if (state is FaqLoading) {
                          return Center(
                            child: defaultLoadingIndication,
                          );
                        } else if (state is FaqError) {
                          return Center(
                            child: Text(
                              state.message,
                            ),
                          );
                        } else if (state is FaqLoaded) {
                          return OnFAQLoadedView(faqList: state.faqList);
                        }
                        return Center(
                          child: Text("NA State: $state"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnFAQLoadedView extends StatelessWidget {
  const OnFAQLoadedView({
    super.key,
    required this.faqList,
  });

  final List<FAQModule> faqList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 163 / 70,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: faqList.mapIndexed((index, faq) {
        return HelpLineGridTile(
          fontSize: 14,
          text: faq.moduleName ?? faq.imsModuleName ?? "",
          onTap: () {},
        );
      }).toList(),
    );
  }
}
