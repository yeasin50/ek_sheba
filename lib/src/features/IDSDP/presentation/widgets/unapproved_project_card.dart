import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_style.dart';
import '../../../../common/widgets/card_decoration.dart';
import '../../../../locator.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import '../pages/pages.dart';
import 'label_decorator.dart';
import 'progress_item_card.dart';

class UnApprovedProjectCard extends StatelessWidget {
  const UnApprovedProjectCard({
    super.key,
  });

  ///provide data on order of [In Preparation, For Recast, In Ministry , In Planning Commission, For Recast]

  void _onDetailsPage(BuildContext context, int index) {
    context.pushNamed(
      DashBoardItemDetailsPage.routeName,
      extra: {
        'itemTitle': index == 0
            ? "In Preparation"
            : index == 1
                ? "For Recast"
                : index == 2
                    ? "In Ministry"
                    : index == 3
                        ? "In Planning Commission"
                        : "For Recast",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final unApprovedRepo = locator<DashboardProjectRepoImpl>().unApprovedRepo;
    //todo: get data from api
    final List<int> data = [
      unApprovedRepo.unapprovedInPreparationProjectCount(),
      unApprovedRepo.unapprovedForRecastProjectCount(),
      unApprovedRepo.unapprovedInMinistryProjectCount(),
      unApprovedRepo.unapprovedInPlanningCommissionProjectCount(),
      unApprovedRepo.unapprovedInEcnecProjectCount(),
    ];

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
      child: CardDecoration(
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
                            onTap: () {
                              _onDetailsPage(context, 4);
                            },
                            title: "For Recast",
                            count: data[4]),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {
                            _onDetailsPage(context, 1);
                          },
                          title: "For Recast",
                          count: data[1],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {
                            _onDetailsPage(context, 2);
                          },
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
                          extraHeight: 10,
                          onTap: () {
                            _onDetailsPage(context, 0);
                          },
                          title: "In Preparation",
                          count: data[0],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          extraHeight: 10,
                          onTap: () {
                            _onDetailsPage(context, 3);
                          },
                          title: "In Planning Commission",
                          count: data[3],
                        ),
                      ),
                      // const Expanded(
                      //   //maintain the size
                      //   child: SizedBox(),
                      // ),
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
