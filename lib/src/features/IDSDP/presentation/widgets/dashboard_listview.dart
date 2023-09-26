import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/app_style.dart';
import '../../../../locator.dart';
import '../../data/models/project_type.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import 'project_list_widget_future.dart';

/// DashboardItems
/// returns a list of items for the dashboard using [Column] widget
class DashboardListView extends StatelessWidget {
  const DashboardListView({super.key, required this.itemTitle});

  final String itemTitle;
  @override
  Widget build(BuildContext context) {
    return getItem(itemTitle);
  }
}

Widget getItem(String title) {
  final type = projectTypeFromTitle(title);
  final future = locator.get<DashboardProjectRepoImpl>().fromType(type);

  return ProjectListFromFuture(future: future);
}
