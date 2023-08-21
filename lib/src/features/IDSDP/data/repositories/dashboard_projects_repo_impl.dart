import 'dart:convert';

import 'package:ek_sheba/src/common/utils/api_config.dart';
import 'package:my_utils/my_utils.dart';
import 'package:http/http.dart' as http;
import '../../../../common/utils/token_storage.dart';
import '../../domain/repositories/dashboard_project_repo.dart';
import '../models/project_type.dart';

class DashboardProjectRepoImpl extends DashBoardProjectRepo {
  DashboardProjectRepoImpl({
    required super.approvedRepo,
    required super.unApprovedRepo,
  });

  @override
  Future<Either<Failure, Unit>> loadProjects() async {
    try {
      final url = Uri.parse(APIInfo.getDashboard);
      final token = await TokenManager.getToken();
      if (token == null) {
        logger.e('loadProjects: token is null');
        return Left(NullFailure());
      }

      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode != 200) {
        logger.e('loadProjects: ${response.body}  $token');
        return Left(NullFailure());
      }
      logger.i('loadProjects: ${response.body}');
      final data = jsonDecode(response.body);
      approvedRepo.init(data['approvedProjects']);
      unApprovedRepo.init(data['unApprovedProjects']);
      return const Right(unit);
    } catch (e) {
      logger.e('loadProjects: ${e.toString()}');
      return Left(NullFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProjectDetails>>> fromType(ProjectType type) async {
    return switch (type) {
      ProjectType.total => await approvedRepo.getApprovedProjects(),
      ProjectType.onGoing => await approvedRepo.getApprovedProjectOnGoing(),
      ProjectType.completed => await approvedRepo.getApprovedProjectCompleted(),
      ProjectType.inPreparation => await unApprovedRepo.getUnapprovedProjectInPreparation(),
      ProjectType.forRecast => await unApprovedRepo.getUnapprovedProjectForRecast(),
      ProjectType.inMinistry => await unApprovedRepo.getUnapprovedProjectInMinistry(),
      ProjectType.inPlanningCommission => await unApprovedRepo.getUnapprovedProjectInPlanningCommission(),
      ProjectType.inECNEC => await unApprovedRepo.getUnapprovedProjectInEcnec(),
      _ => Left(NullFailure()),
    };
  }
}
