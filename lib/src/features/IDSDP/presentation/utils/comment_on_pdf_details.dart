import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/comment_repo_impl.dart';
import '../../domain/entities/project_details.dart';

Future<void> comment({
  required BuildContext context,
  required ProjectDetails project,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: false,
        title: const Text('মন্তব্য/পর্যবেক্ষণ'),
        content: Material(
          child: FutureBuilder(
            future: CommentRepoImpl.getData(project),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong ${snapshot.error}}'));
              }

              if (snapshot.hasData) {
                logger.i("data ${snapshot.data}");
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...snapshot.data
                              ?.map<Widget>(
                                (e) => ListTile(
                                  title: Text(e.comment),
                                ),
                              )
                              .toList() ??
                          [],
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
