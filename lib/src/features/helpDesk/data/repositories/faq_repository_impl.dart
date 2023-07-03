import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/failures.dart';
import '../../../../common/utils/logger.dart';
import '../../domain/entities/faq_info.dart';
import '../../domain/repositories/faq_repository.dart';

class FAQRepositoryImpl implements IFaqRepository {
  @override
  Future<Either<Failure, List<FAQModule>>> getFaq() async {
    try {
      final response = await http.get(Uri.parse("${APIInfo.baseUrl}api/ims-module/get-active-list"));

      if (response.statusCode == 200) {
        final List<FAQModule> faqList = [];
        final List<dynamic> faqListJson = jsonDecode(response.body) as List<dynamic>? ?? [];
        for (var element in faqListJson) {
          faqList.add(FAQModule.fromMap(element));
        }
        logger.i("getFaq: ${faqList.length}");
        return Right(faqList);
      } else {
        logger.e("getFaq: ${response.body}");
        return Left(NullFailure());
      }
    } catch (e) {
      logger.e("getFaq: $e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FAQModule>>> searchFaq(String query) async {
    try {
      final response = await http.get(Uri.parse("${APIInfo.baseUrl}api/ims-module/search?query=$query"));
      if (response.statusCode == 200) {
        final List<FAQModule> faqList = [];
        final List<dynamic> faqListJson = response.body as List<dynamic>? ?? [];
        for (var element in faqListJson) {
          faqList.add(FAQModule.fromMap(element));
        }
        return Right(faqList);
      } else {
        logger.e("searchFaq: ${response.body}");
      }
      return Left(NullFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
