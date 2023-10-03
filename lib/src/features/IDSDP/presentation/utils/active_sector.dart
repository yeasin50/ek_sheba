import '../../../../common/utils/token_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_utils/my_utils.dart';

import 'dart:convert';

Future<Map<int, String>> loadActiveSector() async {
  const url = 'https://gwtraining.plandiv.gov.bd/pps-configuration/sector/activeSector';
  try {
    final token = await TokenManager.getToken();
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final body = response.body;
      final data = jsonDecode(response.body) as List;

      Map<int, String> sectorMap = {};
      for (final item in data) {
        final id = item['id'] as int;
        final name = item['sectorNameEn'] as String;
        sectorMap[id] = name;
      }
      return sectorMap;
    } else {
      logger.e(response.body);
      return {};
    }
  } catch (e) {
    logger.e(e);
    return {};
  }
}
