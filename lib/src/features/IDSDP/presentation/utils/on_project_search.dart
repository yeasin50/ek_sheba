import 'dart:convert';

import '../../../../common/utils/logger.dart';
import '../../../../common/utils/token_storage.dart';
import '../../domain/entities/project_details.dart';
import 'package:http/http.dart' as http;

Future<List<ProjectDetails>> searchProject({
  String? projectName,
  String? sector,
  String? status,
  int? sectorId,
  int page = 0,
}) async {
  const url = 'https://gwtraining.plandiv.gov.bd/external/mobile-apps/search-project-list';

  final body = {
    "pageableRequestBodyDTO": {"page": page, "size": 5},
    "projectTypeId": null,
    "sectorDivisionId": null,
    "projectName": projectName,
    "sectorId": sectorId,
    "lowAmount": null,
    "highAmount": null,
    "status": status,
    "source": null,
  };
  try {
    final token = await TokenManager.getToken();

    if (token == null) {
      logger.d('Token is null');
    }
    final result = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    final content = jsonDecode(result.body)['content'] as List;
    logger.d(content.length);

    final projects = List<ProjectDetails>.from(content.map((e) => ProjectDetails.fromMap(e)));

    return projects;
  } catch (e) {
    logger.e(e);
    return [];
  }
}
