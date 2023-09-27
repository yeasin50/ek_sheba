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

  @override
  Widget build(BuildContext context) {
    final unApprovedRepo = locator<DashboardProjectRepoImpl>().unApprovedRepo;

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
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': "In ECNEC"},
                            );
                          },
                          title: "In ECNEC",
                          count: unApprovedRepo.unapprovedInEcnecProjectCount(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': "For Recast"},
                            );
                          },
                          title: "For Recast",
                          count: unApprovedRepo.unapprovedForRecastProjectCount(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': "In Ministry"},
                            );
                          },
                          title: "In Ministry",
                          count: unApprovedRepo.unapprovedInMinistryProjectCount(),
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
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': "In Preparation"},
                            );
                          },
                          title: "In Preparation",
                          count: unApprovedRepo.unapprovedInPreparationProjectCount(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          extraHeight: 10,
                          onTap: () {
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': "In Planning Commission"},
                            );
                          },
                          title: "In Planning Commission",
                          count: unApprovedRepo.unapprovedInPlanningCommissionProjectCount(),
                        ),
                      ),
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
