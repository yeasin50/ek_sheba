import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/background.dart';

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
                    onSearch: (value) {},
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 163 / 70,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        "About Us",
                        "PPS Software",
                        "NPM Software",
                        "Common QA",
                        "RMS Software",
                        "GRM Software",
                      ].mapIndexed((index, value) {
                        return HelpLineGridTile(
                          fontSize: 14,
                          text: value,
                          onTap: () {},
                        );
                      }).toList(),
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
