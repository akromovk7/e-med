import 'package:flutter/material.dart';

class TextCustom {
  static textDesign({double? height,String? font,double? letterSpacing,double fontsize = 14, Color color = Colors.black}) {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      fontFamily: font ?? "Grotesk",
      letterSpacing: letterSpacing ?? 0,
      height: height ?? 1.0,
    );
  }
}