import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/app_style.dart';
import '../../../../common/widgets/card_decoration.dart';
import '../../../../locator.dart';
import '../../data/models/project_type.dart';
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
      padding: const EdgeInsets.only(top: 12, bottom: 12),
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
                              extra: {'itemTitle': ProjectType.inPreparation.title},
                            );
                          },
                          title: ProjectType.inPreparation.title,
                          count: unApprovedRepo.unapprovedInPreparationProjectCount(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          onTap: () {
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {
                                'itemTitle': ProjectType.forRecast.title,
                              },
                            );
                          },
                          title: ProjectType.forRecast.title,
                          count: unApprovedRepo.unapprovedForRecastProjectCount(),
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
                              extra: {
                                'itemTitle': ProjectType.inMinistry.title,
                              },
                            );
                          },
                          title: ProjectType.inMinistry.title,
                          count: unApprovedRepo.unapprovedInMinistryProjectCount(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ProgressItemCard(
                          extraHeight: 10,
                          onTap: () {
                            context.pushNamed(
                              DashBoardItemDetailsPage.routeName,
                              extra: {'itemTitle': ProjectType.inPlanningCommission.title},
                            );
                          },
                          title: ProjectType.inPlanningCommission.title,
                          count: unApprovedRepo.unapprovedInPlanningCommissionProjectCount(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ProgressItemCard(
                    onTap: () {
                      context.pushNamed(
                        DashBoardItemDetailsPage.routeName,
                        extra: {
                          'itemTitle': ProjectType.inECNEC.title,
                        },
                      );
                    },
                    title: ProjectType.inECNEC.title,
                    count: unApprovedRepo.unapprovedInEcnecProjectCount(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
