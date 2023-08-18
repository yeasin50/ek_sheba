import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

/// return [List<ProjectDetails>] from [data] or [DatabaseFailure] for dashboard project count
Either<Failure, List<ProjectDetails>> projectsFromMap({
  required List<Map<String, dynamic>> data,
}) {
  try {
    final completedList = data.map((e) => ProjectDetails.fromMap(e)).toList();
    return Right(completedList);
  } catch (e) {
    return Left(ServerFailure());
  }
}
