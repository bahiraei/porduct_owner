import 'package:flutter/material.dart';

class Constants {
  static Gradient gradient1 = const LinearGradient(
    colors: [
      Color(0xffD9316E),
      Color(0xff7C0B86),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static List<Color> textGradientColor = [
    const Color(0xffD9316E),
    const Color(0xff7C0B86),
  ];

  static List<Color> textGradientColor2 = [
    const Color(0xff03499B),
    const Color(0xff0BF0FF),
  ];

  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 10,
      offset: const Offset(0, 4),
    )
  ];

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 5,
      offset: const Offset(0, 2),
    )
  ];

  static List<BoxShadow> shadow3 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.50),
      blurRadius: 5,
      offset: const Offset(0, 2),
    )
  ];
}
