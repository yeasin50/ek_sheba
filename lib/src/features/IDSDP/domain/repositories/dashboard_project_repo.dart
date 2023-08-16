import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import 'dashboard_approved_project_repo.dart';
import 'dashboard_unapproved_project_repo.dart';

export 'dashboard_approved_project_repo.dart';
export 'dashboard_unapproved_project_repo.dart';

abstract class DashBoardProjectRepo {
  DashBoardProjectRepo({
    required this.dashBoardProjectRepo,
    required this.dashboardUnapprovedProjectRepo,
  });

  final DashboardApprovedProjectRepo dashBoardProjectRepo;
  final DashboardUnapprovedProjectRepo dashboardUnapprovedProjectRepo;

  ///* Get all projects load when dashboard page load
  /// returns   [Failure] or [Unit]
  Future<Either<Failure, Unit>> loadProjects();
}
