import 'dart:convert';

import 'package:ek_sheba/src/common/extensions/string_extension.dart';
import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../../common/utils/token_storage.dart';
import '../../../pdf/presentation/pages/pdf_page.dart';

/// this function is used on [ProjectDownloadOptions] on [ProjectDetailsPage]
downloadByObservation(BuildContext context, String uuid, {required bool isBn}) async {
  //test  "67c26fb6-d4a0-48e0-a2d6-a6b490371df1";
  final path = "https://gwtraining.plandiv.gov.bd/external/mobile-apps/get-feasibility-study-report/$uuid";

  try {
    final response = await http.get(
      Uri.parse(path),
      headers: {
        'Authorization': 'Bearer ${await TokenManager.getToken()}',
      },
    );

    if (response.statusCode != 200) {
      logger.e(response.body);
      await _showErr(
        context,
        isBn ? "কোন তথ্য পাওয়া যায়নি!" : "There are currently no file available for this project",
      );

      return;
    }
    final data = _ObservationInfo.fromJson(response.body);

    if (!context.mounted) return;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(isBn ? data.fsReportTitleBn : data.fsReportTitleEn),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(!isBn ? "Fesibility Study Report" : "সম্ভাব্যতা যাচাই প্রতিবেদন"),
                trailing: const Icon(Icons.download),
                onTap: () async {
                  final url =
                      "https://gwtraining.plandiv.gov.bd/external/mobile-apps/attachment/get-pdf-file-by-fs-attachment-id/${data.fsAttachmentId}";
                  Navigator.of(context).pop();
                  context.push(
                    PDFPage.routeName,
                    extra: {
                      "path": url,
                      "title": isBn ? data.fsReportTitleBn : data.fsReportTitleEn,
                      "isTokenRequired": true,
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(data.fsAttachmentName.pdfName),
                trailing: const Icon(Icons.download),
                onTap: () async {
                  final url =
                      "https://gwtraining.plandiv.gov.bd/external/mobile-apps/attachment/get-pdf-file-by-fs-uuid/${data.fsUuid}";
                  Navigator.of(context).pop();
                  context.push(
                    PDFPage.routeName,
                    extra: {
                      "path": url,
                      "title": isBn ? data.fsReportTitleBn : data.fsReportTitleEn,
                      "isTokenRequired": true,
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  } catch (e) {
    logger.e(e.toString());
    _showErr(context, "Something went wrong!");
  }
}

_showErr(BuildContext context, String msg) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // title: const Text('Something went wrong!'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Text(msg),
  //   ),
  // );
}

class _ObservationInfo {
  final String fsReportTitleEn;
  final String fsReportTitleBn;
  final String fsUuid;
  final int fsAttachmentId;
  final String fsAttachmentName;
  const _ObservationInfo({
    required this.fsReportTitleEn,
    required this.fsReportTitleBn,
    required this.fsUuid,
    required this.fsAttachmentId,
    required this.fsAttachmentName,
  });

  factory _ObservationInfo.fromMap(Map<String, dynamic> map) {
    return _ObservationInfo(
      fsReportTitleEn: map['fsReportTitleEn'] ?? '',
      fsReportTitleBn: map['fsReportTitleBn'] ?? '',
      fsUuid: map['fsUuid'] ?? '',
      fsAttachmentId: map['fsAttachmentId']?.toInt() ?? 0,
      fsAttachmentName: map['fsAttachmentName'] ?? '',
    );
  }

  factory _ObservationInfo.fromJson(String source) => _ObservationInfo.fromMap(json.decode(source));
}
