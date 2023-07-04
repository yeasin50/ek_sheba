import 'package:fpdart/fpdart.dart';

import '../../../../common/utils/failures.dart';
import '../entities/resource_filterlist.dart';
import '../entities/resource_info.dart';

abstract interface class IResourceRepository {
  Future<Either<Failure,  ResourceFilterInfo>> getFilterList();
  Future<Either<Failure, List<ResourceInfo>>> getActiveList();

  Future<Either<Failure, List<String>>> getYearListByCategory(String category);
  Future<Either<Failure, List<String>>> getMonthListByYear(String year);

  Future<Either<Failure, List<ResourceInfo>>> searchResource({
    required String category,
    required String year,
    required String month,
  });
}
