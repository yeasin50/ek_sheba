import 'dart:convert';

import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:my_utils/my_utils.dart';

import '../../domain/entities/pdf_other_info_model.dart';
import '../../domain/repositories/pdf_other_info_repo.dart';

class PdfOtherInfoImpl implements PdfOtherInfoRepo {
  @override
  Future<Either<Failure, List<PdfOtherInfoModel>>> otherInfo({
    required String id,
    required String projectType,
    int page = 0,
    int size = 1000,
  }) async {
    final path = "https://gwtraining.plandiv.gov.bd/pps-pc/dashboardAttachment/getPageableList/${1950}/DPP";

    final token =
        "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkdXR5VHlwZSI6IkRlc2tfT2ZmaWNlciIsInVzZXJfbmFtZSI6Im5pbGdfZGVza0BtYWlsLmNvbSIsInVzZXJOYW1lIjoibmlsZ19kZXNrQG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9HRVRfQUxMX0FQUFJPVkVEX0RQUC9UQVBQIiwiUk9MRV9HRVRfUFJPSkVDVF9DT05DRVBUX0xJU1RfRk9SX0ZTIiwiUk9MRV9DUkVBVEVfRlNfUFJPUE9TQUwiLCJST0xFX1ZJRVdfUFJPSkVDVF9DT05DRVBUX0RBU0hCT0FSRCIsIlJPTEVfVklFV19EUFAvVEFQUF9EQVNIQk9BUkQiLCJST0xFX0dFVF9SRFBQX1RBUFBfTElTVCIsIlJPTEVfUVVFU1RJT05fQU5TV0VSX0xJU1QiLCJST0xFX0NSRUFURV9QUk9KRUNUX0NPTkNFUFQiLCJST0xFX0VESVRfRFBQL1RBUFBfREFTSEJPQVJEIiwiUk9MRV9DUkVBVEVfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVF9GT1JfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVCIsIlJPTEVfQ1JFQVRFX0ZTX1JFUE9SVCIsIlJPTEVfRURJVF9QUk9KRUNUX0NPTkNFUFRfREFTSEJPQVJEIiwiUk9MRV9WSUVXX0ZTX0RBU0hCT0FSRCJdLCJjbGllbnRfaWQiOiJpYmNzcGxhbm5pbmdpZHNkcCIsImlzSW5zdGl0dXRpb25hbCI6bnVsbCwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sIm9yZ2FuaWdhdGlvbk5hbWUiOm51bGwsIm5hbWUiOiJOSUxHIERlc2sgT2ZmaWNlciIsImlkIjoiODciLCJ1c2VyVHlwZSI6bnVsbCwiZXhwIjoxNjk5ODM5MDExLCJhcHBBY2Nlc3MiOlsiUFBTIl0sImp0aSI6IjhmMjczMTY5LTdiNmItNDJmOS05MzVmLWZjNmY0MGQ3ODA0NCJ9.FwpuXNb6lS7cKQeuIWiW_h6ZJQkgdzjoJAcX-hK2_oBs4LKinntiaw3cEFJOmh7Wf8mDKogEExgHWlYcpCoC-GqNc8Az6xH1e9PmvhtgBvBxs7XYs3iGgqDfszKMIRflO0Y2Mhpxxzh3Z2zMZEmtytfSovq1fioyEHSHHfuKb2dhdwDCcB7qgLAgyJkXPtu9l5qpbS3kj091kF5JurJrC9vGzcRF8NB6oZrYvKFHjl6L1QXy5aFX4ac--U_1SIO1Cz7dy4YR0oHbvKYUpQ0suM9KSYE9TW2J3mECAxt7RtTqb_DpvUweH3lisEQwOHnXs49MzqxH2WWfWlVbQkciEQ";
    // await TokenManager.getToken();
    if (token == null) {
      logger.e('token is null');
      return left(NullFailure());
    }

    try {
      final uri = Uri.parse(path);

      final response = await http.get(uri, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode != 200) return left(ServerFailure());
      final contents = jsonDecode(response.body)['content'] as List?;
      final items = contents?.map((e) => PdfOtherInfoModel.fromMap(e)).toList() ?? [];

      return right(items);
    } catch (e) {
      logger.e(e);
      return left(UnknownFailure(e.toString()));
    }
  }

  @override
  //FIXME: this api is not working
  Future<Either<Failure, List<PdfOtherInfoModel>>> getPdfRelatedMeetingAttachments({
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

      final response = await http.get(uri, headers: {"Authentication": "Bearer $token"});

      if (response.statusCode != 200) {
        logger.e('projectUUID:$projectMovementStageId response.statusCode: ${response.body}');
        return left(ServerFailure());
      }
      final contents = jsonDecode(response.body)['content'] as List?;
      final items = contents?.map((e) => PdfOtherInfoModel.fromMap(e)).toList() ?? [];

      return right(items);
    } catch (e) {
      logger.e(e);
      return left(UnknownFailure(e.toString()));
    }
  }
}
