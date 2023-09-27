import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/api_config.dart';
import '../../../../common/utils/logger.dart';
import '../../domain/entities/resource_filterlist.dart';
import '../../domain/entities/resource_info.dart';
import '../../domain/repositories/resource_repository.dart';

class ResourceRepositoryImpl implements IResourceRepository {
  @override
  Future<Either<Failure, List<ResourceInfo>>> getActiveList() async {
    try {
      final uri = Uri.parse('${APIInfo.baseUrl}api/resources/get-active-list');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<ResourceInfo> resourceList = [];
        final List<dynamic> data = json.decode(response.body) ?? [];
        for (var element in data) {
          resourceList.add(ResourceInfo.fromMap(element));
        }
        return right(resourceList);
      } else {
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResourceFilterInfo>> getFilterList() async {
    try {
      final uri = Uri.parse('${APIInfo.baseUrl}api/resources/get-filter-list');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = ResourceFilterInfo.fromJson(response.body);

        return right(data);
      } else {
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getMonthListByYear(String year) async {
    try {
      final uri = Uri.parse(
          '${APIInfo.baseUrl}api/resources/get-month-list-by-year/$year');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<String> resourceList = [];
        final List<dynamic> data = json.decode(response.body) ?? [];
        for (var element in data) {
          resourceList.add(element);
        }
        return right(resourceList);
      } else {
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getYearListByCategory(
      String category) async {
    try {
      final uri = Uri.parse(
          '${APIInfo.baseUrl}api/resources/get-year-list-by-category/$category');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<String> resourceList = [];
        final List<dynamic> data = json.decode(response.body) ?? [];
        for (var element in data) {
          resourceList.add(element);
        }
        return right(resourceList);
      } else {
        logger.e("getYearListByCategory ${response.body}");
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e("getYearListByCategory $e");
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ResourceInfo>>> searchResource({
    required String? category,
    required String? year,
    required String? month,
  }) async {
    try {
      _getBody() {
        final body = {};
        if (category != null) {
          body['category'] = category;
        }
        if (year != null) {
          body['year'] = year;
        }
        if (month != null) {
          body['month'] = month;
        }
        return json.encode(body);
      }

      final uri = Uri.parse('${APIInfo.baseUrl}api/resources/search-resources');
      final response = await http.post(
        uri,
        body: _getBody(),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<ResourceInfo> resourceList = [];
        final List<dynamic> data = json.decode(response.body) ?? [];
        for (var element in data) {
          resourceList.add(ResourceInfo.fromMap(element));
        }
        return right(resourceList);
      } else {
        logger.e("searchResource ${response.body}");
        return left(ServerFailure());
      }
    } catch (e) {
      logger.e(e);
      return left(ServerFailure());
    }
  }
}
