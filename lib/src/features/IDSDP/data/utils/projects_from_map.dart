import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

/// return [List<ProjectDetails>] from [data] or [DatabaseFailure] for dashboard project count
Either<Failure, List<ProjectDetails>> projectsFromMap({
  required data,
}) {
  try {
    final completedList = List<ProjectDetails>.from(data.map((e) => ProjectDetails.fromMap(e)));
    return Right(completedList);
  } catch (e) {
    logger.e('projectsFromMap: ${e.toString()}');
    return Left(ServerFailure());
  }
}
