import 'dart:convert';

import 'package:ek_sheba/src/features/pdf_other_information/domain/entities/pdf_item_attachemnt.dart';
import 'package:ek_sheba/src/features/pdf_other_information/domain/entities/pdf_other_info_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  group('PdfOtherInfoModel', () {
    final data = fixture('pdf_other_info.json');
    final contents = jsonDecode(data)['content'] as List<dynamic>;
    group('should fetch PdfOtherInfoModel from json', () {
      PdfOtherInfoModel info = PdfOtherInfoModel.fromMap(contents.first);

      test('should be a subclass of PdfOtherInfoModel entity', () async {
        // assert
        expect(info, isA<PdfOtherInfoModel>());
      });

      test('should contain attachment', () async {
        // assert
        expect(info.attachment, isA<PdfItemAttachment>());
      });
    });
  });
}
