import 'package:ek_sheba/src/features/IDSDP/domain/entities/agency.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/agency_and_ministry.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/ministry_division.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  group('agency_and_ministry.dart', () {
    final data = fixture('agency_and_ministry_name.json');

    test('from json', () {
      final agencyAndMinistryInfo = AgencyAndMinistryInfo.fromJson(data);
      expect(agencyAndMinistryInfo, isA<AgencyAndMinistryInfo>());
      expect(agencyAndMinistryInfo.agency, isA<Agency>());
      expect(agencyAndMinistryInfo.agency.id, 713);
      expect(agencyAndMinistryInfo.agency.ministryDivision, isA<MinistryDivision>());
    });
  });
}
