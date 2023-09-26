import '../../domain/entities/dpp_pdf.dart';
import '../../domain/entities/tapp_pdf.dart';

class PdfRepositoryImpl {
  final String baseUrl =
      "https://gwtraining.plandiv.gov.bd/external/mobile-apps/";

  // String getPDFUrl(String uuid, dynamic type) {
  //   assert(type is DppPDF || type is TappPDF, "type is not DppPDF or TappPDF");
  //   final url = "$baseUrl${type.path}?id=$uuid";
  //   return url;
  // }
}
