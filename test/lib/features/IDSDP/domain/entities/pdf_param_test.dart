import 'dart:convert';

import 'package:ek_sheba/src/features/IDSDP/domain/entities/pdf_param.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  test('ddp_p1_response', () async {
    final data = fixture('ddp_p1_response.json');

    PDFParams pdfParams = PDFParams.fromMap(jsonDecode(data));

    expect(pdfParams, isA<PDFParams>());
  });
}
