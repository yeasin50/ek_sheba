import 'package:ek_sheba/src/features/IDSDP/data/utils/projects_from_map.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:my_utils/my_utils.dart';

void main() {
  group('projects from map', () {
    const item1 = {
      "id": 1069,
      "uuid": "de7f63c2-a581-4625-9865-5f73d0964107",
      "titleEn":
          "Development Project Proposal (DPP) For Training Phase 9 Recap",
      "titleBn":
          "প্রশিক্ষণ পর্যায় ৯ এর জন্য উন্নয়ন প্রকল্প প্রস্তাব (ডিপিপি) সংকলন",
      "commencementDate": "2023-02-02",
      "completionDate": "2025-06-11",
      "projectType": {
        "id": 1,
        "uuid": "f4e8c6ad-7748-410d-9d57-3220dfbc33cd",
        "nameEn": "DPP",
        "nameBn": "ডিপিপি",
        "code": "1"
      },
      "sector": {
        "id": 18,
        "uuid": "ad866a34-564d-4607-b6c6-7d6d5d535051",
        "nameEn": "Local Government and Rural Development",
        "nameBn": "স্থানীয় সরকার ও পল্লী উন্নয়ন",
        "code": "08"
      },
      "sectorDivision": {
        "id": 2,
        "uuid": "b2dd0665-b8da-4ab9-b593-bbe52076bf26",
        "nameEn":
            "Agricultural, Water Resources and Rural Institutions Division",
        "nameBn": "কৃষি, পানি সম্পদ ও পল্লী প্রতিষ্ঠান বিভাগ",
        "code": "01"
      },
      "agency": {
        "id": 713,
        "uuid": "10712a54-49da-bb15-7b5c5b4ca46b",
        "nameEn": "National Institute of Local Government",
        "nameBn": "জাতীয় স্থানীয় সরকার ইনস্টিটিউট",
        "code": "131012300"
      },
      "ministryDivision": {
        "id": 10,
        "uuid": "d2662d09-faed-453d-ac7e-0d0a25b058aa",
        "nameEn": "Local Government Division",
        "nameBn": "স্থানীয় সরকার বিভাগ",
        "code": "137"
      },
      "status": "APPROVED_BY_PLANNING_MINISTER",
      "totalAmount": 1186.0
    };

    test(
      'ProjectDetails.fromMap',
      () {
        final result = ProjectDetails.fromMap(item1);

        expect(result, isA<ProjectDetails>());
      },
    );
    test(
      'ProjectDetails.fromMap',
      () {
        const data = [item1];

        final result = projectsFromMap(data: data);

        expect(result, isA<Right<Failure, List<ProjectDetails>>>());
      },
    );
  });
}
