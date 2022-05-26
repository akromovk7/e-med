import 'package:flutter/material.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/radius_const.dart';

class ButtonStyles {
  static elevetedStyle({required BuildContext context,required double height,required double width, Color backgroundcolor = ConsColors.kPrimaryColor, Color borderColor = Colors.transparent,Color onPrimary = Colors.white}) {
    return ElevatedButton.styleFrom(
      onPrimary: onPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiuConst.small)),
        primary: backgroundcolor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(width, height));
  }
  
}
