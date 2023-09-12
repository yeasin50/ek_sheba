import 'dart:convert';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';
import 'package:ek_sheba/src/features/IDSDP/data/repositories/approved_project_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() { 
  group('approved_project_repo_impl', () {
    final data = jsonDecode(fixture('dashboard_projects.json'));
    DashboardApprovedProjectRepoImpl approvedProjectRepoImpl = DashboardApprovedProjectRepoImpl();

    setUp(() {
      approvedProjectRepoImpl.init(data['approvedProjects']);
      print('setUp');
    });

    test('should return  completed project count', () {
      // arrange

      // act
      final apc = approvedProjectRepoImpl.approvedCompletedProjectCount();
      final apog = approvedProjectRepoImpl.approvedOnGoingProjectCount();
      final ap = approvedProjectRepoImpl.approvedProjectCount();

      expect(apog, 17);
      expect(ap, 23);
      expect(apc, 6);
    });

    test(
      'getApprovedProjectCompleted',
      () async {
        // arrange
        // act
        final result = approvedProjectRepoImpl.getApprovedProjectCompleted();

        // assert
        expect(result, isA<Future>());

        final data = await result;

        expect(data, isA<Right>());
        expect(data.asRight(), isA<List<ProjectDetails>>());
        expect(data.asRight().length, 6);
      },
    );

    test(
      'getApprovedProjectOnGoing',
      () async {
        // arrange
        // act
        final result = approvedProjectRepoImpl.getApprovedProjectOnGoing();

        // assert
        expect(result, isA<Future>());

        final data = await result;

        expect(data, isA<Right>());
        expect(data.asRight(), isA<List<ProjectDetails>>());
        expect(data.asRight().length, 17);
      },
    );

    test('getApprovedProjects', () async {
      // arrange
      // act
      final result = approvedProjectRepoImpl.getApprovedProjects();

      // assert
      expect(result, isA<Future>());

      final data = await result;

      expect(data, isA<Right>());
      expect(data.asRight(), isA<List<ProjectDetails>>());
      expect(data.asRight().length, 23);
    });
  });
}
