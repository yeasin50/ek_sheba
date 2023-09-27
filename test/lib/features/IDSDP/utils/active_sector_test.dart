import 'package:ek_sheba/src/features/IDSDP/presentation/utils/active_sector.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture.dart';

void main() {
  group('Active Sector test', () {
    // final data = fixture('active_sector.json');

    test(
      "Fetch active sector",
      () async {
        final data = await loadActiveSector();
        expect(data, isNotNull);
      },
    );
  });
}
