import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

import '../entities/project_details.dart';
export '../entities/project_details.dart';
export 'package:fpdart/fpdart.dart';

abstract interface class DashboardApprovedProjectRepo {
  void init(Map<String, dynamic> data);

  ///**** Approved Project
  int approvedOnGoingProjectCount();
  int approvedCompletedProjectCount();
  int approvedProjectCount();

  /// Get approved project OnGoing
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjectOnGoing();

  /// Get approved project Completed
  /// returns   [Failure] or [List<ProjectDetails>]
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjectCompleted();

  /// Get total approved project
  Future<Either<Failure, List<ProjectDetails>>> getApprovedProjects();
}
