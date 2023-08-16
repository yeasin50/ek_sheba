import 'package:ek_sheba/src/common/utils/failures.dart';

import '../../domain/repositories/dashboard_project_repo.dart';
import '../utils/counter_from_key.dart';
import '../utils/projects_from_map.dart';

class DashboardApprovedProjectRepoImpl implements DashboardApprovedProjectRepo {
  /// this map should be value of [approvedProjects]
  late final Map<String, dynamic> data;

  @override
  void init(Map<String, dynamic> data) => this.data = data;

  @override
  Future<Either<Failure, int>> approvedCompletedProjectCount() => counterFromKey(data['completedProjectCount']);

  @override
  Future<Either<Failure, int>> approvedOnGoingProjectCount() => counterFromKey(data['onGoingProjectCount']);

  @override
  Future<Either<Failure, int>> approvedProjectCount() => counterFromKey(data['totalProjectCount']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjectCompleted() async =>
      projectsFromMap(data: data['completedProjectList']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjectOnGoing() async =>
      projectsFromMap(data: data['onGoingProjectList']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjects() async =>
      projectsFromMap(data: data['totalProjectList']);
}
