import 'dart:convert';

import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/pdf_param.dart';
 
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:my_utils/my_utils.dart';

void main() {
  Future<http.Response?> getData() async {
    try {
      final pcUuid = "b6000133-b334-4985-ab29-a5546948b927";
      final token =
          "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkdXR5VHlwZSI6IkRlc2tfT2ZmaWNlciIsInVzZXJfbmFtZSI6Im5pbGdfZGVza0BtYWlsLmNvbSIsInVzZXJOYW1lIjoibmlsZ19kZXNrQG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9HRVRfQUxMX0FQUFJPVkVEX0RQUC9UQVBQIiwiUk9MRV9HRVRfUFJPSkVDVF9DT05DRVBUX0xJU1RfRk9SX0ZTIiwiUk9MRV9DUkVBVEVfRlNfUFJPUE9TQUwiLCJST0xFX1ZJRVdfUFJPSkVDVF9DT05DRVBUX0RBU0hCT0FSRCIsIlJPTEVfVklFV19EUFAvVEFQUF9EQVNIQk9BUkQiLCJST0xFX0dFVF9SRFBQX1RBUFBfTElTVCIsIlJPTEVfUVVFU1RJT05fQU5TV0VSX0xJU1QiLCJST0xFX0NSRUFURV9QUk9KRUNUX0NPTkNFUFQiLCJST0xFX0VESVRfRFBQL1RBUFBfREFTSEJPQVJEIiwiUk9MRV9DUkVBVEVfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVF9GT1JfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVCIsIlJPTEVfQ1JFQVRFX0ZTX1JFUE9SVCIsIlJPTEVfRURJVF9QUk9KRUNUX0NPTkNFUFRfREFTSEJPQVJEIiwiUk9MRV9WSUVXX0ZTX0RBU0hCT0FSRCJdLCJjbGllbnRfaWQiOiJpYmNzcGxhbm5pbmdpZHNkcCIsImlzSW5zdGl0dXRpb25hbCI6bnVsbCwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sIm9yZ2FuaWdhdGlvbk5hbWUiOm51bGwsIm5hbWUiOiJOSUxHIERlc2sgT2ZmaWNlciIsImlkIjoiODciLCJ1c2VyVHlwZSI6bnVsbCwiZXhwIjoxNjk2NjYxNDE4LCJhcHBBY2Nlc3MiOlsiUFBTIl0sImp0aSI6Ijc3MDFkMGNkLTMxZGEtNGNkMi04OGRjLTc1YzU0ZDkxOTEyNCJ9.YpOQ7o1IPHr_ndx0ZuwUIN-0rIum2JUKkS_F5eOYKg1Dt0SFzA8wT1GgaWhQ48dvimRiWy7MAN4AMgNd0bcvVCsWtWG_ybfReVydTN8AFanIhO-GCY56pdXgJUVnLSEym3omQO_3wkt79uEDdwSo_-0eus9c0309pznRvE52Nb2nQq3wxyHXcK3caiRLzCphCCCVi9EU8YZf0M-A1YUefYJLPoFJNror-jOPB0ZCRyYo5PLQrGR9zhOJFxnd3PRXCwLtOINe3eTFg6yJuI7AetFBK7nH3jTafxZ32qvIl6XG4ctEy5MYEtSRJb0o7nDSuayj6MrsbBwiY8TO7ncT0Q";

      final url = "https://gwtraining.plandiv.gov.bd/external/mobile-apps/get-dpp-report-data/part-a/${pcUuid}";
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${token}",
      });

      return response;
    } catch (e) {
      logger.e("pdf Error: ${e.toString()}");
    }
  }

  getPDF() async {
    try {
      // final result = await getData();
      // final data = string2Raw(result?.body);
      // logger.i('pdf: result: ${data}');

      const url = "https://report.plandiv.gov.bd/public/index.php/api/pdf-generate-post";

      final agency = {
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
        // "ministryDivisionDTO": {
        //   "id": 10,
        //   "uuid": "d2662d09-faed-453d-ac7e-0d0a25b058aa",
        //   "code": "137",
        //   "entryCode": "137",
        //   "nameEn": "Local Government Division",
        //   "nameBn": "স্থানীয় সরকার বিভাগ",
        //   "shortName": "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।",
        //   "description":
        //       "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।Local Government Division",
        //   "status": true
        // }
      };

      ///encode the nested map  values of the map
      final Map body = {
        "fileName": 'Part-A ',
        "lng": 'bn',
        "agency": agency,
      };

      final d = dio.Dio();
      final formData = dio.FormData();

      //json with url encoded
      // var response = await http.post(
      //   Uri.parse(url),
      //   headers: {
      //     "Content-Type": "application/x-www-form-urlencoded",
      //   },
      //   body: body.entries
      //       .map(
      //         (entry) => '${entry.key}=${Uri.encodeComponent(entry.value)}',
      //       )
      //       .join('&'),
      // );

      var response = await d.post(
        url,
        data: paramsx.toMap(),
      );

      if (response.statusCode == 200) {
        logger.i('pdf getPDF response: ${response.statusCode}');

        logger.i('pdf getPDF response: ${response.data}');
      } else {
        logger.e('pdf getPDF response: ${response.statusCode}');
        // logger.e('pdf getPDF response: ${response.body.toString().substring(0, 100)}');
      }
      return response;
    } catch (e) {
      logger.e("pdf getPDF Error: ${e.toString()}");
    }
  }

  test('response ', () async {
    final result = await getPDF();

    // print(result?.body);
  });
}

final paramsx = PDFParams(
  fileName: 'Part-A ',
  templateName: 'pps-reports/dpp/Part_A_Report_Bn_22',
  lng: 'bn',
  agency: {
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
      "shortName": "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।",
      "description":
          "স্থানীয় সরকার, পল্লী উন্নয়ন ও সমবায় মন্ত্রণালয়/ পল্লী উন্নয়ন ও সমবায় বিভাগ।Local Government Division",
      "status": true
    }
  },
  sectorDivision: {
    "id": 2,
    "uuid": "b2dd0665-b8da-4ab9-b593-bbe52076bf26",
    "code": "01",
    "sectorDivisionCode": "01",
    "sectorDivisionNameEn": "Agricultural, Water Resources and Rural Institutions Division",
    "sectorDivisionNameBn": "কৃষি, পানি সম্পদ ও পল্লী প্রতিষ্ঠান বিভাগ",
    "description": "Agriculture, Water Resources and Rural Institutions Division",
    "status": true
  },
  projectSummary: {
    "id": 1407,
    "uuid": "67c26fb6-d4a0-48e0-a2d6-a6b490371df1",
    "paripatraVersionId": 3,
    "projectCode":
        "Agricultural, Water Resources and Rural Institutions Division-Local Government and Rural Development-Rural Development and Cooperatives-16-31",
    "projectTypeId": 1,
    "priorityId": 1,
    "titleEn": "Rural Infrasructure Devilopment Project of Jamalpur and Sherpur District.",
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
  },
  getByProjectConcept: {},
  estimatedProjectCost: [
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
  ],
  totalAmount: '৮০৬৫.০০',
  gobAmount: '৮০৬৫.০০',
  gobFeAmount: '০.০০',
  paAmount: '০.০০',
  paRpaAmount: '০.০০',
  ownFundAmount: '০.০০',
  ownFeAmount: '০.০০',
  othersAmount: '০.০০',
  otherFeAmount: '০.০০',
  fiscalYearsList: [
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
  ],
  upazilas: [],
  projectAreaJustification: '',
  revenueList: [],
  revenueTotal: '',
  capitalList: [],
  capitalTotal: '',
  physicalContingencyTotal: '',
  priceContingencyTotal: '',
  grantTotal: '',
  projectManagement: {},
  getLogFrame: "",
  view: 0,
  print_r: 0,
  key: "324234FSDSWER54534#(SkY#@",
);
