import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import '../../../../../fixture/fixture.dart';

void main() {
  group('Project details', () {
    final data = fixture('project_details.json');
    group("From Json", () {
      test('get project from json', () async {
        // arrange
        // act
        final projectDetails = ProjectDetails.fromJson(data);
        // assert
        expect(projectDetails, isA<ProjectDetails>());

        expect(projectDetails.projectStageBn, "সংস্থায় আছে");
        expect(projectDetails.projectStageEn, "IN AGENCY");
        expect(projectDetails.projectStatusBn, "এজেন্সী এর ডেস্ক");
        expect(projectDetails.projectStatusEn, "AGENCY DESK");
        expect(projectDetails.showAssignedOfficer, true);
        expect(projectDetails.assignedOfficer, "NILG Desk Officer");
        expect(projectDetails.nothiStatusBn, "খসড়া");
        expect(projectDetails.nothiStatusEn, "Draft");
        expect(projectDetails.subSector?.nameBn, "পল্লী উন্নয়ন ও সমবায়");
        expect(projectDetails.subSector?.nameEn,
            "Rural Development and Cooperatives");
        expect(projectDetails.subSector?.code, "41");
      });
    });
  });
}
