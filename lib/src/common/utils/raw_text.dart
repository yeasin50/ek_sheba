import 'dart:convert' show utf8;

String? string2Raw(String? x) => x == null ? null : utf8.decode(x.codeUnits);
