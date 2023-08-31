import 'package:ek_sheba/src/common/utils/raw_text.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

void main() {
  getData() async {
    try {
      final pcUuid = "b6000133-b334-4985-ab29-a5546948b927";
      final token =
          "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJkdXR5VHlwZSI6IkRlc2tfT2ZmaWNlciIsInVzZXJfbmFtZSI6Im5pbGdfZGVza0BtYWlsLmNvbSIsInVzZXJOYW1lIjoibmlsZ19kZXNrQG1haWwuY29tIiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9HRVRfQUxMX0FQUFJPVkVEX0RQUC9UQVBQIiwiUk9MRV9HRVRfUFJPSkVDVF9DT05DRVBUX0xJU1RfRk9SX0ZTIiwiUk9MRV9DUkVBVEVfRlNfUFJPUE9TQUwiLCJST0xFX1ZJRVdfUFJPSkVDVF9DT05DRVBUX0RBU0hCT0FSRCIsIlJPTEVfVklFV19EUFAvVEFQUF9EQVNIQk9BUkQiLCJST0xFX0dFVF9SRFBQX1RBUFBfTElTVCIsIlJPTEVfUVVFU1RJT05fQU5TV0VSX0xJU1QiLCJST0xFX0NSRUFURV9QUk9KRUNUX0NPTkNFUFQiLCJST0xFX0VESVRfRFBQL1RBUFBfREFTSEJPQVJEIiwiUk9MRV9DUkVBVEVfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVF9GT1JfRFBQL1RBUFAiLCJST0xFX0dFVF9QUk9KRUNUX0NPTkNFUFRfTElTVCIsIlJPTEVfQ1JFQVRFX0ZTX1JFUE9SVCIsIlJPTEVfRURJVF9QUk9KRUNUX0NPTkNFUFRfREFTSEJPQVJEIiwiUk9MRV9WSUVXX0ZTX0RBU0hCT0FSRCJdLCJjbGllbnRfaWQiOiJpYmNzcGxhbm5pbmdpZHNkcCIsImlzSW5zdGl0dXRpb25hbCI6bnVsbCwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sIm9yZ2FuaWdhdGlvbk5hbWUiOm51bGwsIm5hbWUiOiJOSUxHIERlc2sgT2ZmaWNlciIsImlkIjoiODciLCJ1c2VyVHlwZSI6bnVsbCwiZXhwIjoxNjk2NjYxNDE4LCJhcHBBY2Nlc3MiOlsiUFBTIl0sImp0aSI6Ijc3MDFkMGNkLTMxZGEtNGNkMi04OGRjLTc1YzU0ZDkxOTEyNCJ9.YpOQ7o1IPHr_ndx0ZuwUIN-0rIum2JUKkS_F5eOYKg1Dt0SFzA8wT1GgaWhQ48dvimRiWy7MAN4AMgNd0bcvVCsWtWG_ybfReVydTN8AFanIhO-GCY56pdXgJUVnLSEym3omQO_3wkt79uEDdwSo_-0eus9c0309pznRvE52Nb2nQq3wxyHXcK3caiRLzCphCCCVi9EU8YZf0M-A1YUefYJLPoFJNror-jOPB0ZCRyYo5PLQrGR9zhOJFxnd3PRXCwLtOINe3eTFg6yJuI7AetFBK7nH3jTafxZ32qvIl6XG4ctEy5MYEtSRJb0o7nDSuayj6MrsbBwiY8TO7ncT0Q";

      final url = "https://gwtraining.plandiv.gov.bd/external/mobile-apps/get-dpp-report-data/part-a/${pcUuid}";
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": "Bearer ${token}",
      });

      return response.body;
    } catch (e) {
      print(e);
    }
  }

  getPDF(body) async {
    final url = "https://report.plandiv.gov.bd/public/index.php/api/pdf-generate-post";

    //json with url encoded
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      print(response.bodyBytes);
    } catch (e) {
      print(e);
    }
  }

  // test('response ', () async {
  //   final result = await getData();
  //   print(string2Raw(result));
  //   await getPDF(result);
  // });
}
