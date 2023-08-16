import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import '../entities/project_details.dart';

abstract interface class DashboardUnapprovedProjectRepo {
  
  void init(Map<String, dynamic> data);

  Future<Either<Failure, int>> unapprovedInPreparationProjectCount();
  Future<Either<Failure, int>> unapprovedForRecastProjectCount();
  Future<Either<Failure, int>> unapprovedInMinistryProjectCount();
  Future<Either<Failure, int>> unapprovedInPlanningCommissionProjectCount();
  Future<Either<Failure, int>> unapprovedInEcnecProjectCount();

  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPreparation();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectForRecast();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInMinistry();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInPlanningCommission();
  Future<Either<Failure, List<ProjectDetails>>> getUnapprovedProjectInEcnec();
}
