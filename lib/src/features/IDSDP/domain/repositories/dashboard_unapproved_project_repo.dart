import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/project_details.dart';

abstract interface class DashboardUnapprovedProjectRepo {
  void init(Map<String, dynamic> data);

  int unapprovedInPreparationProjectCount();
  int unapprovedForRecastProjectCount();
  int unapprovedInMinistryProjectCount();
  int unapprovedInPlanningCommissionProjectCount();
  int unapprovedInEcnecProjectCount();

  Future<Either<Failure, List<ProjectDetails>>>
      getUnapprovedProjectInPreparation();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectForRecast();
  Future<Either<Failure, List<ProjectDetails>>>
      getUnapprovedProjectInMinistry();
  Future<Either<Failure, List<ProjectDetails>>>
      getUnapprovedProjectInPlanningCommission();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInEcnec();
}
