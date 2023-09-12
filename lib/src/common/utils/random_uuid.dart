import 'dart:math';

String generateRandomUUID() {
  final random = Random();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0F) | 0x40; // Set the version to 4 (random UUID)
  bytes[8] = (bytes[8] & 0x3F) | 0x80; // Set the variant to RFC 4122

  final List<String> hexBytes = bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).toList();
  final String uuid =
      '${hexBytes.sublist(0, 4).join('')}-${hexBytes.sublist(4, 6).join('')}-${hexBytes.sublist(6, 8).join('')}-${hexBytes.sublist(8, 10).join('')}-${hexBytes.sublist(10, 16).join('')}';

  return uuid;
}
