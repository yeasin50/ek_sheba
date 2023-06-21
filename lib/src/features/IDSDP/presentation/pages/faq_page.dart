import 'package:ek_sheba/src/common/app_style.dart';
import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/minimal_appbar.dart';
import '../widgets/search_widget.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    final gridItemTextStyle = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFFFFFFFF),
    );
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
                        return Card(
                          color: AppStyle.buttonGreenLight,
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                value,
                                style: gridItemTextStyle,
                              ),
                            ),
                          ),
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
