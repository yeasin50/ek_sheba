import 'dart:convert';

import 'package:ek_sheba/src/features/IDSDP/data/repositories/approved_project_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  group('approved_project_repo_impl', () async {
    final data = jsonDecode(fixture('dashboard_projects.json'));

    test('should return completed project count', () async {
      // arrange
      const onGoingProjectCount = 17;
      const completedProjectCount = 6;
      const totalProjectCount = 23;

      final approvedProjectRepoImpl = DashboardApprovedProjectRepoImpl();
      approvedProjectRepoImpl.init(data['approvedProjects']);

      // act
      final apc = await approvedProjectRepoImpl.approvedCompletedProjectCount();
      final apog = await approvedProjectRepoImpl.approvedOnGoingProjectCount();
      final ap = await approvedProjectRepoImpl.approvedProjectCount();

      // assert
      expect(apc.isRight(), true);
      apc.fold(
        (l) => null,
        (r) => expect(r, completedProjectCount),
      );
    });
  });
}
