import 'package:flutter/material.dart';

import '../../../../common/app_style.dart';
import 'label_decorator.dart';
import 'progress_item_card.dart';

class UnApprovedProjectCard extends StatelessWidget {
  const UnApprovedProjectCard({
    super.key,
  });

  ///provide data on order of [In Preparation, For Recast, In Ministry , In Planning Commission, For Recast]

  @override
  Widget build(BuildContext context) {
    //todo: get data from api
    final List<int> data = [5, 5, 0, 4, 0];

    const label = Padding(
      padding: EdgeInsets.only(left: 7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: LabelDecoratorWidget(
          color: AppStyle.textWhite,
          text: 'Unapproved Project',
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyle.textWhite,
          boxShadow: AppStyle.boxShadow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black.withAlpha(75),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -12),
              child: label,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 7.0,
                right: 7.0,
                bottom: 24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {},
                          title: "In Preparation",
                          count: data[0],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {},
                          title: "For Recast",
                          count: data[1],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {},
                          title: "In Ministry",
                          count: data[2],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {},
                          title: "In Planning Commission",
                          count: data[3],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(onTap: () {}, title: "For Recast", count: data[4]),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                          //maintain the size
                          child: SizedBox()),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
