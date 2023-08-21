import 'package:ek_sheba/src/features/IDSDP/data/models/project_type.dart';
import 'package:my_utils/my_utils.dart';

import '../../domain/repositories/dashboard_project_repo.dart';
import '../utils/counter_from_key.dart';
import '../utils/projects_from_map.dart';

class DashboardUnapprovedProjectRepoImpl implements DashboardUnapprovedProjectRepo {
  /// this map should be value of [unApprovedProjects]
  late Map<String, dynamic> data;

  @override
  void init(Map<String, dynamic> data) => this.data = data;

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectForRecast() async =>
      projectsFromMap(data: data[ProjectType.forRecast]);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInEcnec() async =>
      projectsFromMap(data: data[ProjectType.inECNEC]);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInMinistry() async =>
      projectsFromMap(data: data[ProjectType.inMinistry]);
  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPlanningCommission() async =>
      projectsFromMap(data: data[ProjectType.inPlanningCommission]);

  @override
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPreparation() async =>
      projectsFromMap(data: data[ProjectType.inPreparation]);

  @override
  int unapprovedForRecastProjectCount() => counterFromKey(data['forRecastProjectCount']);

  @override
  int unapprovedInEcnecProjectCount() => counterFromKey(data['inEcnecProjectCount']);

  @override
  int unapprovedInMinistryProjectCount() => counterFromKey(data['inMinistryProjectCount']);

  @override
  int unapprovedInPlanningCommissionProjectCount() => counterFromKey(data['inPlanningCommissionProjectCount']);

  @override
  int unapprovedInPreparationProjectCount() => counterFromKey(data['inPreparationProjectCount']);
}
