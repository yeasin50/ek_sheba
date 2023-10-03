import 'package:flutter/material.dart';
import 'package:my_utils/my_utils.dart';

import '../../../../common/utils/logger.dart';
import '../../domain/entities/project_details.dart';
import 'project_list_build.dart';

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

          return ProjectListBuild(
            projectDetails: snapshot.data ?? [],
          );
        }

        return const Center(child: Text('NA state'));
      },
    );
  }
}
