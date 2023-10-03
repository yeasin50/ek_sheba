import 'dart:convert';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/comment_model.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/token_storage.dart';

class CommentRepoImpl {
  static Future<List<Comment>> getData(ProjectDetails project) async {
    try {
      //from data
      //  "projectConceptUuid": project.uuid,
      //     "projectType": project.projectType.nameEn,
      final response = await http.get(
        Uri.parse(
          'https://gwtraining.plandiv.gov.bd/external/mobile-apps/comments/get-by-project-concept-uuid-and-project-type',
        ),
        headers: {
          'Authorization': 'Bearer ${await TokenManager.getToken()}',
        },
      );

      if (response.statusCode != 200) {
        logger.e('CommentRepoImpl: ${response.statusCode}');
        return [];
      }

      final agencyCommentList = jsonDecode(response.body)['agencyCommentList'] ?? [];
      final comments = agencyCommentList?.map<Comment>((e) => Comment.fromJson(e)).toList() ?? [];

      return comments;
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
