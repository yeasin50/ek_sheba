import 'package:my_utils/my_utils.dart';

import '../../domain/repositories/dashboard_project_repo.dart';
import '../models/project_type.dart';
import '../utils/counter_from_key.dart';
import '../utils/projects_from_map.dart';

class DashboardApprovedProjectRepoImpl implements DashboardApprovedProjectRepo {
  /// this map should be value of [approvedProjects]
  late Map<String, dynamic> data;

  @override
  void init(Map<String, dynamic> data) => this.data = data;

  @override
  int approvedCompletedProjectCount() =>
      counterFromKey(data['completedProjectCount']);

  @override
  int approvedOnGoingProjectCount() =>
      counterFromKey(data['onGoingProjectCount']);

  @override
  int approvedProjectCount() => counterFromKey(data['totalProjectCount']);

  @override
  Future<Either<Failure, List<ProjectDetails>>>
      getApprovedProjectCompleted() async =>
          projectsFromMap(data: data[ProjectType.completed.key]);

  @override
  Future<Either<Failure, List<ProjectDetails>>>
      getApprovedProjectOnGoing() async =>
          projectsFromMap(data: data[ProjectType.onGoing.key]);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjects() async =>
      projectsFromMap(data: data[ProjectType.total.key]);
}
