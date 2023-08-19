import 'dart:convert';
import 'package:my_utils/my_utils.dart';
import 'package:ek_sheba/src/features/IDSDP/data/repositories/approved_project_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  test('smoke test', () => expect(true, true));

  group('approved_project_repo_impl', () {
    final data = jsonDecode(fixture('dashboard_projects.json'));

    test('should return completed project count', () async {
      // arrange
      final approvedProjectRepoImpl = DashboardApprovedProjectRepoImpl();
      approvedProjectRepoImpl.init(data['approvedProjects']);

      // act
      final apc = await approvedProjectRepoImpl.approvedCompletedProjectCount();
      final apog = await approvedProjectRepoImpl.approvedOnGoingProjectCount();
      final ap = await approvedProjectRepoImpl.approvedProjectCount();

      // assert
      expect(apc, 6);
      expect(apog, 17);
      expect(ap, 23);
    });
  });
}
