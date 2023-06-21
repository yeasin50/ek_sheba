import 'package:flutter/material.dart';

class AppStyle {
  /// appBar
  static const Color lightGreen = Color(0xFFC0E8D3);

  static const Color buttonGreen = Color(0xFF377D61);
  static const Color buttonWhite = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color buttonGreenLight = Color(0xFF61AB9E);

  static const Color textBlack = Color(0xFF282020);
  static const Color textGreen = Color(0xFF377D61);
  static const Color textWhite = Color(0xFFFFFFFF);

  ///used on outline + icon
  static const outlineColor = Color(0xFF6E7D91);

  static const List<BoxShadow> boxShadowSmall = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 1,
      offset: Offset(0, 2),
    ),
  ];

  static final List<BoxShadow> boxShadow = const [
    Offset(0, 1),
    Offset(1, 1),
    Offset(0, -1),
    Offset(-1, 0),
  ]
      .map((e) => BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 1,
            offset: e,
          ))
      .toList();

  static const BoxDecoration appBarDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFEAF7F0),
        AppStyle.lightGreen,
      ],
    ),
  );
}
