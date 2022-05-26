import 'package:flutter/material.dart';
import 'package:med_app/core/constants/color_const.dart';

class MyTheme {
  static ThemeData get mytheme => ThemeData(
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ConsColors.kWhite))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ConsColors.kPrimaryColor))),
      colorScheme: const ColorScheme.light(
          primary: ConsColors.kPrimaryColor, brightness: Brightness.light));
}
