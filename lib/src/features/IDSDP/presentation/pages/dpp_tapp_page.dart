import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/logger.dart';
import '../../../../common/utils/token_storage.dart';
import '../../../../common/widgets/background.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/project_list_widget_future.dart';

class DPPTAPPPage extends StatelessWidget {
  const DPPTAPPPage({super.key});
  static const String routeName = '/dpp_tapp';

  @override
  Widget build(BuildContext context) {
    final future = _searchProject();
    return BackgroundDecoration(
      hasDrawer: true,
      body: Column(
        children: [
          const IDSDPAppBar(
            hasDrawer: true,
            hasHomeButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: ProjectListFromFuture(
                future: future,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<ProjectDetails>> _searchProject() async {
  const url = 'https://gwtraining.plandiv.gov.bd/external/mobile-apps/search-project-list';

  final body = {
    "pageableRequestBodyDTO": {"page": 0, "size": 50},
    "projectTypeId": null,
    "sectorDivisionId": null,
    "projectName": null,
    "sectorId": null,
    "lowAmount": null,
    "highAmount": null,
    "status": null,
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
