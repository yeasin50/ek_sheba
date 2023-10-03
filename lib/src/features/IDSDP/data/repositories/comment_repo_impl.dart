import 'dart:convert';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/comment_model.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/token_storage.dart';

class CommentRepoImpl {
  static Future<List<Comment>> getData(ProjectDetails project) async {
    try {
      const baseUrl =
          "https://gwtraining.plandiv.gov.bd/external/mobile-apps/comments/get-by-project-concept-uuid-and-project-type";

      final uri = Uri.parse(baseUrl);
      final Map<String, String> queryParams = {
        'projectConceptUuid': "67c26fb6-d4a0-48e0-a2d6-a6b490371df1", // project.uuid,
        'projectType': "DPP" //  project.projectType.nameEn,
      };
      final uriWithQueryParams = uri.replace(queryParameters: queryParams);
      final response = await http.get(
        uriWithQueryParams,
        headers: {
          'Authorization': 'Bearer ${await TokenManager.getToken()}',
        },
      );
      if (response.statusCode != 200) {
        logger.e('CommentRepoImpl: ${response.statusCode}');
        return [];
      }

      final agencyCommentList = jsonDecode(response.body)['agencyCommentList'] ?? [];

      final comments = List.from(agencyCommentList).map((e) => Comment.fromMap(e)).toList();
      logger.i(comments.length);
      return comments;
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
