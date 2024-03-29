import '../../../../common/app_style.dart';
import '../../../../common/utils/logger.dart';
import '../../data/models/project_type.dart';
import '../bloc/idsdp_bloc.dart';
import 'progress_item_card.dart';
import '../../../../locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/dashboard_item_details_page.dart';
import 'label_decorator.dart';

class ApprovedProjectCard extends StatelessWidget {
  const ApprovedProjectCard({super.key});

  void _navToProjectDetails(BuildContext context, String itemTitle) {
    logger.i("ApprovedProjectCard: _navToProjectDetails: itemTitle: $itemTitle");
    context.push(
      DashBoardItemDetailsPage.routeName,
      extra: {'itemTitle': itemTitle},
    );
  }

  @override
  Widget build(BuildContext context) {
    final approvedRepo = (locator<IdsdpBloc>().state as IdsdpLoaded).repo.approvedRepo;

    const label = Padding(
      padding: EdgeInsets.only(left: 7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: LabelDecoratorWidget(text: 'Approved Project'),
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
              padding: const EdgeInsets.only(left: 7.0, right: 7.0, bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {
                        _navToProjectDetails(context, ProjectType.total.title);
                      },
                      title: "Total",
                      count: approvedRepo.approvedProjectCount(),
                      color: const Color(0xffE1F2FE),
                      textColor: const Color(0xff3B82F6),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {
                        _navToProjectDetails(context, ProjectType.onGoing.title);
                      },
                      title: ProjectType.onGoing.title,
                      count: approvedRepo.approvedOnGoingProjectCount(),
                      color: const Color(0xffFBE6FE),
                      textColor: const Color(0xff9333EA),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ProgressItemCard(
                      onTap: () {
                        _navToProjectDetails(context, "Completed");
                      },
                      title: "Completed",
                      count: approvedRepo.approvedCompletedProjectCount(),
                      color: const Color(0xffD9FBE8),
                      textColor: const Color(0xff0D9488),
                    ),
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
