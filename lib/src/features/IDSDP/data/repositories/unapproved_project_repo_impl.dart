import 'package:my_utils/my_utils.dart';

import '../../domain/repositories/dashboard_project_repo.dart';
import '../utils/counter_from_key.dart';
import '../utils/projects_from_map.dart';

class DashboardApprovedProjectRepoImpl implements DashboardUnapprovedProjectRepo {
  /// this map should be value of [unApprovedProjects]
  late final Map<String, dynamic> data;

  @override
  void init(Map<String, dynamic> data) => this.data = data;

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectForRecast() async =>
      projectsFromMap(data: data['forRecastProjectList']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInEcnec() async =>
      projectsFromMap(data: data['inEcnecProjectList']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInMinistry() async =>
      projectsFromMap(data: data['inMinistryProjectList']);
  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPlanningCommission() async =>
      projectsFromMap(data: data['inPlanningCommissionProjectList']);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPreparation() async =>
      projectsFromMap(data: data['inPreparationProjectList']);

  @override
  Future<Either<Failure, int>> unapprovedForRecastProjectCount() => counterFromKey(data['forRecastProjectCount']);

  @override
  Future<Either<Failure, int>> unapprovedInEcnecProjectCount() => counterFromKey(data['inEcnecProjectCount']);

  @override
  Future<Either<Failure, int>> unapprovedInMinistryProjectCount() => counterFromKey(data['inMinistryProjectCount']);

  @override
  Future<Either<Failure, int>> unapprovedInPlanningCommissionProjectCount() =>
      counterFromKey(data['inPlanningCommissionProjectCount']);

  @override
  Future<Either<Failure, int>> unapprovedInPreparationProjectCount() =>
      counterFromKey(data['inPreparationProjectCount']);
}
