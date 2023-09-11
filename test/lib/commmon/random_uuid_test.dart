import 'package:ek_sheba/src/common/utils/random_uuid.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('random', () {
    final data  =  generateRandomUUID();
    print(data);
  });
}
