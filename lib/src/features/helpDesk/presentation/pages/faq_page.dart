import 'package:collection/collection.dart';
import 'package:ek_sheba/src/features/helpDesk/data/repositories/faq_repository_impl.dart';
import 'package:ek_sheba/src/features/helpDesk/domain/entities/faq_info.dart';
import 'package:ek_sheba/src/features/helpDesk/presentation/bloc/faq/faq_bloc.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/background.dart';

import '../widgets/widgets.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  static const routeName = '/faq';

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  late final FaqBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = FaqBloc(locator<FAQRepositoryImpl>());
    bloc.add(FaqFetchEvent());
  }

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
                    onSearch: (value) {},
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: BlocBuilder<FaqBloc, FaqState>(
                      bloc: bloc,
                      builder: (context, state) {
                        if (state is FaqLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
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
          text: faq.moduleName ?? "no name",
          onTap: () {},
        );
      }).toList(),
    );
  }
}
