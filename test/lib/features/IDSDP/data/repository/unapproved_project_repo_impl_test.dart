import 'dart:convert';
import 'package:ek_sheba/src/features/IDSDP/data/repositories/unapproved_project_repo_impl.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/repositories/dashboard_project_repo.dart';
import 'package:my_utils/my_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  group('approved_project_repo_impl', () {
    final data = jsonDecode(fixture('dashboard_projects.json'));

    DashboardUnapprovedProjectRepo repo = DashboardUnapprovedProjectRepoImpl();

    setUp(() {
      repo.init(data['unApprovedProjects']);
    });

    test('should return completed project count', () async {
      // arrange

      // act
      final epc = await repo.unapprovedInEcnecProjectCount();
      final empc = await repo.unapprovedInMinistryProjectCount();
      final eppc = await repo.unapprovedInPlanningCommissionProjectCount();
      final epp = await repo.unapprovedInPreparationProjectCount();
      final eprc = await repo.unapprovedForRecastProjectCount();

      expect(epp, 153);
      expect(empc, 14);
      expect(eppc, 13);
      expect(epc, 3);
      expect(eprc, 4);
    });

    test('getUnapprovedProjectForRecast', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectForRecast();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 4);
    });

    test('getUnapprovedProjectInEcnec', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInEcnec();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
     expect(data.length, 3);
    });

    test('getUnapprovedProjectInMinistry', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInMinistry();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 14);
    });

    test('getUnapprovedProjectInPlanningCommission', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInPlanningCommission();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 13);
    });

    test('getUnapprovedProjectInPreparation', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInPreparation();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 153);
    });

    test('getUnapprovedProjectInMinistry', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInMinistry();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 14);
    });

    test('getUnapprovedProjectInPlanningCommission', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInPlanningCommission();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 13);
    });

    test('getUnapprovedProjectInPreparation', () async {
      // arrange
      // act
      final result = await repo.getUnapprovedProjectInPreparation();

      // assert
      expect(result, isA<Right>());

      final data = result.asRight();

      expect(data, isA<List<ProjectDetails>>());
      expect(data.length, 153);
    });
  });
}
