import 'dart:convert' show utf8;

String? string2Raw(String? x) => x == null
    ? null
    : () {
        try {
          return utf8.decode(x.codeUnits);
        } catch (e) {
          return x;
        }
      }();
