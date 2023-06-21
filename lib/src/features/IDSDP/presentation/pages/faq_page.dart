import '../../../../common/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../widgets/helpline_grid_tile.dart';
import '../widgets/minimal_appbar.dart';
import '../widgets/search_widget.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
      body: Column(
        children: [
          MinimalAppBar(
            title: 'FAQ',
            onBackButtonPressed: () {},
          ),
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
