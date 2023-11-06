
import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:my_utils/my_utils.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/pdf_other_info_repo.dart';

class PdfOtherInfoImpl implements PdfOtherInfoRepo {
  @override
  Future<Either<Failure, PaginatedProjectAttachments>> otherInfo({
    required String id,
    required String projectType,
    int page = 0,
    int size = 1000,
  }) async {
    final path =
        "https://gwtraining.plandiv.gov.bd/pps-pc/dashboardAttachment/getPageableList/$id/$projectType?page=$page&size=$size";
    // final path = "https://gwtraining.plandiv.gov.bd/pps-pc/dashboardAttachment/getPageableList/${1950}/DPP";

    final token = await TokenManager.getToken();
    if (token == null) {
      logger.e('token is null');
      return left(NullFailure());
    }

    try {
      final uri = Uri.parse(path);

      final response = await http.get(uri, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode != 200) {
        logger.e('projectUUID:$id $path \n response.statusCode: ${response.body}');
        return left(ServerFailure());
      }
      final data = PaginatedProjectAttachments.fromJson(response.body);

      return right(data);
    } catch (e) {
      logger.e(e);
      return left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginatedProjectAttachments>> getPdfRelatedMeetingAttachments({
    required String projectMovementStageId,
    int page = 0,
    int size = 1000,
  }) async {
    // https://gwtraining.plandiv.gov.bd/pps-dpp-tapp/project-movement-stage-attachment/attachment/get-movement-attachment-by-id/{{projectMovementStageId}}/0/10000
    final path =
        "https://gwtraining.plandiv.gov.bd/pps-dpp-tapp/project-movement-stage-attachment/attachment/get-movement-attachment-by-id/$projectMovementStageId/$page/$size";
    final token = await TokenManager.getToken();
    if (token == null) {
      logger.e('token is null');
      return left(NullFailure());
    }
    try {
      final uri = Uri.parse(path);

      final response = await http.get(uri, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode != 200) {
        logger.e('projectUUID:$projectMovementStageId response.statusCode: ${response.body}');
        return left(ServerFailure());
      }
      final data = PaginatedProjectAttachments.fromJson(response.body);

      return right(data);
    } catch (e) {
      logger.e(e);
      return left(UnknownFailure(e.toString()));
    }
  }
}
