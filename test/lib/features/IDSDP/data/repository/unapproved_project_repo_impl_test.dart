import 'dart:convert';
import 'package:ek_sheba/src/features/IDSDP/data/repositories/unapproved_project_repo_impl.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/repositories/dashboard_project_repo.dart';
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
      final repo = DashboardUnapprovedProjectRepoImpl();
      repo.init(data['unApprovedProjects']);

      // act
      final epc = await repo.unapprovedInEcnecProjectCount();
      final empc = await repo.unapprovedInMinistryProjectCount();
      final eppc = await repo.unapprovedInPlanningCommissionProjectCount();
      final epp = await repo.unapprovedInPreparationProjectCount();
      final eprc = await repo.unapprovedForRecastProjectCount();

      // assert
      // "inPreparationProjectCount": 152,
      // "forRecastProjectCount": 4,
      // "inMinistryProjectCount": 14,
      // "inPlanningCommissionProjectCount": 13,
      // "inEcnecProjectCount": 3

      expect(epp.asRight(), 152);
      expect(empc.asRight(), 14);
      expect(eppc.asRight(), 13);
      expect(epc.asRight(), 3);
      expect(eprc.asRight(), 4);

    });
  });
}
