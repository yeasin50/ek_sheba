import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:ek_sheba/src/features/helpDesk/presentation/pages/pdf_view_page.dart';
import 'package:ek_sheba/src/pdf_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'test_pdf_test_body.dart';
import 'test_pdf_variable.dart';

class TestPDFPage extends StatefulWidget {
  const TestPDFPage({super.key});

  static const routeName = '/test_pdf_page';

  @override
  State<TestPDFPage> createState() => _TestPDFPageState();
}

class _TestPDFPageState extends State<TestPDFPage> {
  String? path;

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

  Future<http.Response?> getPDF() async {
    try {
      // final result = await getData();
      // final data = string2Raw(result?.body);
      // logger.i('pdf: result: ${data}');

      final url = "https://report.plandiv.gov.bd/public/index.php/api/pdf-generate-post";

      final encodedData = testBody.entries.map((entry) {
        final key = Uri.encodeComponent(entry.key);
        final value = Uri.encodeComponent(entry.value.toString());
        return '$key=$value';
      }).join('&');
      //json with url encoded
      var response = await http.post(
        Uri.parse(url),
        body: encodedData,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      if (response.statusCode == 200) {
        logger.i('pdf getPDF response: ${response.contentLength}');
        logger.i('pdf getPDF response: ${response.body}');
      } else {
        logger.e('pdf getPDF response: ${response.statusCode}');
        logger.e('pdf getPDF response: ${response.body}');
      }
      return response;
    } catch (e) {
      logger.e("pdf getPDF Error: ${e.toString().substring(0, 100)}");
    }
  }

  Future<File?> createFileFromPdfUrl(http.Response response) async {
    try {
      logger.d("response contentLength: ${response.contentLength}");
      final bytes = response.body;

      /// on download folder path
      // final dir = await getDownloadsDirectory();
      Directory dir = Directory('/storage/emulated/0/Download');
      final filePath = dir!.path + "/report.pdf";
//
//       // Write the file content to a file
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      return file;
    } catch (e) {
      logger.e(" createFileFromPdfUrl Error: ${e.toString()}");
      throw e;
    }
  }

  late var future = () async {
    final response = await getPDF();
    logger.i(response!.bodyBytes);

    // return createFileFromPdfUrl(response!);
    return response.body;
  }();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: 'https://github.com/espresso3389/flutter_pdf_render/raw/master/example/assets/hello.pdf',
      ),
      // body: FutureBuilder(
      //   future: future,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(child: Text(snapshot.error.toString()));
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //     return Text(snapshot.data.toString());
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await getPDF();

          final file = await createFileFromPdfUrl(response!);
          logger.i('downloaded file: ${file}');
        },
      ),
    );
  }
}
