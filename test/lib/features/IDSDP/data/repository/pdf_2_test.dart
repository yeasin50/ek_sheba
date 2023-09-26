import 'package:ek_sheba/src/features/IDSDP/domain/entities/pdf_param.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  const url =
      'https://report.plandiv.gov.bd/public/index.php/api/pdf-generate-post';

  final uri = Uri.parse(url);

  test('pdf generate', () async {
    final params = param();
    final response = await http.post(
      uri,
      body: params.toUrlEncoded(),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    final body = json.decode(response.body);
    print(body);
    // expect(response.statusCode, 200);
  });
}

PDFParams param() {
  const fileName = 'Part-A';
  const templateName = 'pps-reports/dpp/Part_A_Report_Bn_22';
  const lng = 'lng';
  const agency = {
    "id": 713,
    "uuid": "10712a54-49da-bb15-7b5c5b4ca46b",
    "ministryDivisionId": 10,
    "code": "131012300",
    "entryCode": "131012300",
    "nameEn": "National Institute of Local Government",
    "nameBn": "জাতীয় স্থানীয় সরকার ইনস্টিটিউট",
    "fiscalYear": "2021-12-01",
    "ceilingAmount": 6000000000,
    "shortName": "",
    "description": "",
    "status": true,
    "ministryDivisionDTO": {
      "id": 10,
      "uuid": "d2662d09-faed-453d-ac7e-0d0a25b058aa",
      "code": "137",
      "entryCode": "137",
      "nameEn": "Local Government Division",
      "nameBn": "স্থানীয় সরকার বিভাগ",
      "shortName":
          "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।",
      "description":
          "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।Local Government Division",
      "status": true
    }
  };

  const sectorDivision = {
    "id": 1407,
    "uuid": "67c26fb6-d4a0-48e0-a2d6-a6b490371df1",
    "paripatraVersionId": 3,
    "projectCode":
        "Agricultural, Water Resources and Rural Institutions Division-Local Government and Rural Development-Rural Development and Cooperatives-16-31",
    "projectTypeId": 1,
    "priorityId": 1,
    "titleEn":
        "Rural Infrasructure Devilopment Project of Jamalpur and Sherpur District.",
    "titleBn": "জামালপুর ও শেরপুর জেলার গ্রামীণ অবকাঠামো উন্নয়ন প্রকল্প।",
    "objectivesEn": "<p>dkjfa kldj dlkjf dslfj sadlkfjls sdlfjs&nbsp;</p>\n",
    "objectivesBn": "<p>ৃুকিাৃকাি&nbsp;ুৃদািক দুিতাকতদুি দিকাুৃ&nbsp;</p>\n",
    "expCommencementDate": "2023-07-16",
    "expCompletionDate": "2025-12-31",
    "totalAmount": 0,
    "gobAmount": 0,
    "feGobAmount": 0,
    "ownFundAmount": 0,
    "feOwnFundAmount": 0,
    "paAmount": 0,
    "rpaAmount": 0,
    "dpaAmount": 0,
    "otherAmount": 0,
    "feOtherAmount": 0,
    "sectorDivisionId": 2,
    "sectorId": 18,
    "subSectorId": 30,
    "mainCofogId": 1,
    "optionalCofogId": 3,
    "detailsCofogId": 14,
    "isSelfFund": false,
    "isForeignAid": false,
    "agreementNo": "",
    "agreementAttachmentId": null,
    "agencyId": 713,
    "projectConceptSummary": {
      "id": 1401,
      "uuid": "70ac5d74-30d6-4fe8-9489-4151a295642f",
      "projectConceptMasterId": 1407,
      "catEnvRulesId": 0,
      "isEcaRequired": false,
      "descriptionEca": null,
      "ecaAttachmentId": null,
      "isEiaRequired": false,
      "descriptionEia": null,
      "eiaAttachmentId": null,
      "isLandRequired": false,
      "descriptionLand": null,
      "landAttachmentId": null,
      "isFeasibilityRequired": false,
      "descriptionFs": null,
      "fsAttachmentId": null,
      "isPppRequired": false,
      "descriptionPpp": null,
      "pppAttachmentId": null,
      "relevanceWithShortProgram": "",
      "relevanceWithShortProgramAttachmentId": null,
      "relevanceWithProposal": "",
      "relevanceWithProposalAttachmentId": null,
      "institutionalArrangement": "",
      "institutionalArrangementAttachmentId": null,
      "relevanceWithOtherDevelopment": "",
      "relevanceWithOtherDevelopmentAttachmentId": null,
      "expectedBenefits": "",
      "expectedBenefitsAttachmentId": null,
      "ecaAttachmentName": null,
      "eiaAttachmentName": null,
      "landAttachmentName": null,
      "fsAttachmentName": null,
      "pppAttachmentName": null,
      "relevanceWithShortProgramAttachmentName": null,
      "relevanceWithProposalAttachmentName": null,
      "institutionalArrangementAttachmentName": null,
      "relevanceWithOtherDevelopmentAttachmentName": null,
      "expectedBenefitsAttachmentName": null
    },
    "projectTypeDTO": {
      "id": 1,
      "uuid": "f4e8c6ad-7748-410d-9d57-3220dfbc33cd",
      "code": "1",
      "projectTypeCode": "DPP",
      "nameEn": "DPP",
      "nameBn": "ডিপিপি",
      "description": "DPP",
      "status": true
    },
    "agreementAttachmentName": null,
    "userGroup": null,
    "agencyDTO": null,
    "createdDate": "2023-07-17",
    "status": null,
    "sponsoringMinistryName": "Local Government Division",
    "implementingAgencyName": "National Institute of Local Government",
    "sourceModuleType": "DPP_TAPP",
    "pcLinkId": 1358,
    "ppsCode": "20231872311407",
    "amsId": null,
    "amsCode": null,
    "financeCode": null,
    "movementDate": "2023-07-17T04:23:53.677+00:00",
    "ecnecId": null,
    "isParipatra2016": false,
    "annexureAmount": null,
    "location": null,
    "paripatraVersion": {
      "id": 3,
      "uuid": "de204945-d9b2-4330-ad6c-3a55757fb47c",
      "code": "te-06-21-3",
      "nameEn": "Paripatra 2022",
      "nameBn": "পরিপত্র ২০২২",
      "publishDate": "2022-06-01",
      "startDate": "2022-07-01",
      "endDate": "2026-06-30",
      "description": "Paripatra 2022",
      "status": true
    }
  };

  const getByProjectConcept = {};
  final estimatedProjectCost = [
    {
      "dppAnnualPhasing": "Revenue_Component",
      "dppAnnualPhasingCostTotal": [
        {
          "id": 5656,
          "uuid": "1ee6e982-7a5c-49fb-9f9c-c4ed1313c339",
          "fiscalYear": null,
          "qty": 8065,
          "totalAmount": 8065,
          "gobAmount": 8065,
          "gobFeAmount": 0,
          "gobThruAmount": 0,
          "spAcAmount": 0,
          "thruPdAmount": 0,
          "thruDpAmount": 0,
          "ownFundAmount": 0,
          "ownFundFeAmount": 0,
          "otherAmount": 0,
          "otherFeAmount": 0,
          "totalProjectCost": null
        }
      ],
      "grandTotal": [
        {
          "fiscalYear": "2023-2024",
          "dppAnnualPhasingCostTotal": {
            "id": 5727,
            "uuid": "a1eaf621-9861-411a-aa4b-c0cc77d7250c",
            "fiscalYear": "2023-2024",
            "qty": null,
            "totalAmount": 8065,
            "gobAmount": 8065,
            "gobFeAmount": 0,
            "gobThruAmount": 0,
            "spAcAmount": 0,
            "thruPdAmount": 0,
            "thruDpAmount": 0,
            "ownFundAmount": 0,
            "ownFundFeAmount": 0,
            "otherAmount": 0,
            "otherFeAmount": 0,
            "totalProjectCost": null
          }
        }
      ],
      "grandTotal": []
    }
  ];

  const totalAmount = "৮০৬৫.০০";
  const gobAmount = "৮০৬৫.০০";
  const gobFeAmount = "০.০০";
  const paAmount = "০.০০";
  const paRpaAmount = "০০.০০";
  const ownFundAmount = "০.০০";
  const ownFeAmount = "০.০০";
  const othersAmount = "০.০০";
  const otherFeAmount = "০.০০";

  const fiscalYearsList = [
    {
      "fiscalYear": "২০২৩-২০২৪",
      "govAmount": "৮০৬৫.০০",
      "govFeAmount": "০.০০",
      "rpaAmount": "০.০০",
      "dpaAmount": "০.০০",
      "ownFundAmount": "০.০০",
      "ownFundFeAmount": "০.০০",
      "otherAmount": "০.০০",
      "otherFeAmount": "০.০০",
      "totalAmount": "৮০৬৫.০০"
    }
  ];

  final projectSummary = {
    "id": 1407,
    "uuid": "67c26fb6-d4a0-48e0-a2d6-a6b490371df1",
    "paripatraVersionId": 3,
    "projectCode":
        "Agricultural, Water Resources and Rural Institutions Division-Local Government and Rural Development-Rural Development and Cooperatives-16-31",
    "projectTypeId": 1,
    "priorityId": 1,
    "titleEn":
        "Rural Infrasructure Devilopment Project of Jamalpur and Sherpur District.",
    "titleBn": "জামালপুর ও শেরপুর জেলার গ্রামীণ অবকাঠামো উন্নয়ন প্রকল্প।",
    "objectivesEn": "<p>dkjfa kldj dlkjf dslfj sadlkfjls sdlfjs&nbsp;</p>\n",
    "objectivesBn": "<p>ৃুকিাৃকাি&nbsp;ুৃদািক দুিতাকতদুি দিকাুৃ&nbsp;</p>\n",
    "expCommencementDate": "2023-07-16",
    "expCompletionDate": "2025-12-31",
    "totalAmount": 0,
    "gobAmount": 0,
    "feGobAmount": 0,
    "ownFundAmount": 0,
    "feOwnFundAmount": 0,
    "paAmount": 0,
    "rpaAmount": 0,
    "dpaAmount": 0,
    "otherAmount": 0,
    "feOtherAmount": 0,
    "sectorDivisionId": 2,
    "sectorId": 18,
    "subSectorId": 30,
    "mainCofogId": 1,
    "optionalCofogId": 3,
    "detailsCofogId": 14,
    "isSelfFund": false,
    "isForeignAid": false,
    "agreementNo": "",
    "agreementAttachmentId": null,
    "agencyId": 713,
    "projectConceptSummary": {
      "id": 1401,
      "uuid": "70ac5d74-30d6-4fe8-9489-4151a295642f",
      "projectConceptMasterId": 1407,
      "catEnvRulesId": 0,
      "isEcaRequired": false,
      "descriptionEca": null,
      "ecaAttachmentId": null,
      "isEiaRequired": false,
      "descriptionEia": null,
      "eiaAttachmentId": null,
      "isLandRequired": false,
      "descriptionLand": null,
      "landAttachmentId": null,
      "isFeasibilityRequired": false,
      "descriptionFs": null,
      "fsAttachmentId": null,
      "isPppRequired": false,
      "descriptionPpp": null,
      "pppAttachmentId": null,
      "relevanceWithShortProgram": "",
      "relevanceWithShortProgramAttachmentId": null,
      "relevanceWithProposal": "",
      "relevanceWithProposalAttachmentId": null,
      "institutionalArrangement": "",
      "institutionalArrangementAttachmentId": null,
      "relevanceWithOtherDevelopment": "",
      "relevanceWithOtherDevelopmentAttachmentId": null,
      "expectedBenefits": "",
      "expectedBenefitsAttachmentId": null,
      "ecaAttachmentName": null,
      "eiaAttachmentName": null,
      "landAttachmentName": null,
      "fsAttachmentName": null,
      "pppAttachmentName": null,
      "relevanceWithShortProgramAttachmentName": null,
      "relevanceWithProposalAttachmentName": null,
      "institutionalArrangementAttachmentName": null,
      "relevanceWithOtherDevelopmentAttachmentName": null,
      "expectedBenefitsAttachmentName": null
    },
    "projectTypeDTO": {
      "id": 1,
      "uuid": "f4e8c6ad-7748-410d-9d57-3220dfbc33cd",
      "code": "1",
      "projectTypeCode": "DPP",
      "nameEn": "DPP",
      "nameBn": "ডিপিপি",
      "description": "DPP",
      "status": true
    },
    "agreementAttachmentName": null,
    "userGroup": null,
    "agencyDTO": null,
    "createdDate": "2023-07-17",
    "status": null,
    "sponsoringMinistryName": "Local Government Division",
    "implementingAgencyName": "National Institute of Local Government",
    "sourceModuleType": "DPP_TAPP",
    "pcLinkId": 1358,
    "ppsCode": "20231872311407",
    "amsId": null,
    "amsCode": null,
    "financeCode": null,
    "movementDate": "2023-07-17T04:23:53.677+00:00",
    "ecnecId": null,
    "isParipatra2016": false,
    "annexureAmount": null,
    "location": null,
    "paripatraVersion": {
      "id": 3,
      "uuid": "de204945-d9b2-4330-ad6c-3a55757fb47c",
      "code": "te-06-21-3",
      "nameEn": "Paripatra 2022",
      "nameBn": "পরিপত্র ২০২২",
      "publishDate": "2022-06-01",
      "startDate": "2022-07-01",
      "endDate": "2026-06-30",
      "description": "Paripatra 2022",
      "status": true
    }
  };

  const upazilas = [];
  const projectAreaJustification = '';

  const revenueList = [];
  const revenueTotal = '';
  const capitalList = [];
  const capitalTotal = '';
  const physicalContingencyTotal = '';
  const priceContingencyTotal = '';
  const grantTotal = '';
  const projectManagement = {};
  const getLogFrame = '';
  const view = 0;
  const print_r = 0;
  const key = '324234FSDSWER54534#(SkY#@';

  final params = PDFParams(
      fileName: fileName,
      templateName: templateName,
      lng: lng,
      agency: agency,
      sectorDivision: sectorDivision,
      projectSummary: projectSummary,
      getByProjectConcept: getByProjectConcept,
      estimatedProjectCost: estimatedProjectCost,
      totalAmount: totalAmount,
      gobAmount: gobAmount,
      gobFeAmount: gobFeAmount,
      paAmount: paAmount,
      paRpaAmount: paRpaAmount,
      ownFundAmount: ownFundAmount,
      ownFeAmount: ownFeAmount,
      othersAmount: othersAmount,
      otherFeAmount: otherFeAmount,
      fiscalYearsList: fiscalYearsList,
      upazilas: upazilas,
      projectAreaJustification: projectAreaJustification,
      revenueList: revenueList,
      revenueTotal: revenueTotal,
      capitalList: capitalList,
      capitalTotal: capitalTotal,
      physicalContingencyTotal: physicalContingencyTotal,
      priceContingencyTotal: priceContingencyTotal,
      grantTotal: grantTotal,
      projectManagement: projectManagement,
      getLogFrame: getLogFrame,
      view: view,
      print_r: print_r,
      key: key);

  return params;
}
