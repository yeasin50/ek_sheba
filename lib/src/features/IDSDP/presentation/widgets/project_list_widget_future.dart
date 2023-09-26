import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/logger.dart';
import '../../domain/entities/project_details.dart';
import '../pages/project_details_page.dart';
import 'project_card.dart';

class ProjectListFromFuture extends StatelessWidget {
  const ProjectListFromFuture({
    super.key,
    required this.future,
  });

  final Future<List<ProjectDetails>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectDetails>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          logger.e('getItem: ${snapshot.error.toString()}');
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.hasData) {
          logger.d('getItem: ${snapshot.data}');

          return Column(
            children: snapshot.data != null
                ? snapshot.data!
                    .mapIndexed(
                      (sl, e) => ProjectPlanInfoCard(
                        sl: sl + 1,
                        projectDetails: e,
                        onTap: () {
                          if (context.mounted) {
                            context.push(ProjectDetailsPage.routeName, extra: e);
                          }
                        },
                      ),
                    )
                    .toList()
                : [],
          );
        }

        return const Center(child: Text('NA state'));
      },
    );
  }
}
