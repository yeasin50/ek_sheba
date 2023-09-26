import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/common/utils/token_storage.dart';
import 'package:ek_sheba/src/common/widgets/background.dart';
import 'package:ek_sheba/src/common/widgets/minimal_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../locator.dart';
import '../../data/models/project_type.dart';
import '../../data/repositories/dashboard_projects_repo_impl.dart';
import '../../domain/entities/project_details.dart';
import '../widgets/dashboard_listview.dart';

class DPPTAPPPage extends StatelessWidget {
  const DPPTAPPPage({super.key});
  static const String routeName = '/dpp_tapp';

  @override
  Widget build(BuildContext context) {
    return BackgroundDecoration(
        body: Column(
      children: [
        const MinimalAppBar(title: 'DPP/TAPP'),
        Expanded(
          child: FutureBuilder(
            future: _searchProject(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final type = projectTypeFromTitle('');
                final future = locator.get<DashboardProjectRepoImpl>().fromType(type);
                return DashboardListView(
                  itemTitle: '',
                  future: future,
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    ));
  }
}

Future<List> _searchProject() async {
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

    final projects = List.from(content.map((e) => ProjectDetails.fromMap(e)));

    return projects;
  } catch (e) {
    logger.e(e);
    return [];
  }
}
