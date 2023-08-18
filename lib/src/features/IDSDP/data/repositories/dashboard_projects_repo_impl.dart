import 'dart:convert';

import 'package:ek_sheba/src/common/utils/api_config.dart';
import 'package:my_utils/my_utils.dart';
import 'package:http/http.dart' as http;
import '../../domain/repositories/dashboard_project_repo.dart';

class DashboardProjectRepoImpl extends DashBoardProjectRepo {
  DashboardProjectRepoImpl({
    required super.approvedRepo,
    required super.unApprovedRepo,
  });

  @override
  Future<Either<Failure, Unit>> loadProjects() async {
    try {
      final url = Uri.parse(APIInfo.getDashboard);
      final response = await http.get(
        url,
        headers: {
          // "Authorization": "Bearer ${APIInfo.token}",
        }
      );

      if (response.statusCode != 200) {
        logger.e('loadProjects: ${response.statusCode}');
        return Left(NullFailure());
      }
      final data = jsonDecode(response.body);
      approvedRepo.init(data['approvedProjects']);
      unApprovedRepo.init(data['unApprovedProjects']);
      return const Right(unit);
    } catch (e) {
      return Left(NullFailure());
    }
  }
}
