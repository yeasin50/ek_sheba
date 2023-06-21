import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'helpline_grid_tile.dart';

/// this widget is used to show the options for the guideline page
/// it takes a list of [titles] and a [onTap] function
/// returns a [GridView.count] with 2 columns
class GuideLineOptions extends StatelessWidget {
  const GuideLineOptions({
    super.key,
    required this.titles,
    required this.onTap,
  });
  final List<String> titles;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 163 / 73,
      children: titles.mapIndexed((index, value) {
        return HelpLineGridTile(
          fontSize: 12,
          text: value,
          isFilled: index == 0,
          onTap: () => onTap(index),
        );
      }).toList(),
    );
  }
}
