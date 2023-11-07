import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../data/repositories/comment_repo_impl.dart';
import '../../domain/entities/project_details.dart';

Future<void> comment({
  required BuildContext context,
  required ProjectDetails project,
}) async {
  final isBn = project.isForeignAid;
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: false,
        title: Text(isBn?  "মন্তব্য / পর্যবেক্ষণ" : "Comment / Observation",),
        content: Material(
          child: FutureBuilder(
            future: CommentRepoImpl.getData(project),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong ${snapshot.error}}'));
              }

              if (snapshot.hasData) {
                logger.i("data ${snapshot.data}");
                final data = snapshot.data ?? [];

                final items = groupBy(data, (p0) => p0.observer);
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (items.isEmpty) Center(child: Text(isBn ? 'কোন মন্তব্য নেই' : 'No comments found')),
                      ...items.entries.map(
                        (e) {
                          return ExpansionTile(
                            title: Text(e.key),
                            children: [
                              ...e.value.map(
                                (e) {
                                  return ListTile(
                                    title: Text(e.comment),
                                  );
                                },
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                );
              }

              return const Center(child: Text('NA state'));
            },
          ),
        ),
      );
    },
  );
}
