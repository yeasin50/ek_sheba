import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchWidget(
                  onSearch: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
