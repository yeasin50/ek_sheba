import 'dart:convert';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:fpdart/fpdart.dart';

import 'package:http/http.dart' as http;

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/failures.dart';
import '../../domain/entities/guideline_info.dart';
import '../../domain/repositories/guideline_repository.dart';

class GuidelineRepositoryImpl implements IGuidelineRepository {
  @override
  Future<Either<Failure, List<GuideLineInfo>>> getGuidelines() async {
    try {
      final uri = Uri.parse("${APIInfo.baseUrl}api/ims-module/get-development_module-list");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<GuideLineInfo> guidelineList = [];
        final List<dynamic> guidelineListJson = jsonDecode(response.body) as List<dynamic>? ?? [];
        for (var element in guidelineListJson) {
          guidelineList.add(GuideLineInfo.fromMap(element));
        }
        logger.i("getGuidelines: ${guidelineList.length}");
        return Right(guidelineList);
      } else {
        logger.e("getGuidelines: ${response.body}");
        return Left(NullFailure());
      }
    } catch (e) {
      logger.e(e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<GuideLineInfo>>> getGuidelinesByModule({
    String? imsModuleId,
  }) async {
    try {
      if (imsModuleId == null) {
        logger.e("getGuidelinesByModule: imsModuleId is null");
        return Left(NullFailure());
      }

      final uri = Uri.parse("${APIInfo.baseUrl}api/guideline/get-active-list-by-module-id");
      final body = {"imsModuleId": imsModuleId};
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final List<GuideLineInfo> guidelineList = [];
        final List<dynamic> guidelineListJson = jsonDecode(response.body) as List<dynamic>? ?? [];
        for (var element in guidelineListJson) {
          guidelineList.add(GuideLineInfo.fromMap(element));
        }
        logger.i("getGuidelinesByModule: ${response.body}");
        return Right(guidelineList);
      } else {
        logger.e("getGuidelinesByModule: ${response.body}");
        return Left(NullFailure());
      }
    } catch (e) {
      logger.e(e.toString());
      return Left(ServerFailure());
    }
  }
}
