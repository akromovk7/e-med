import 'package:flutter/material.dart';
import 'package:med_app/core/constants/color_const.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConsColors.kPrimaryColor,
      body: Center(
        child: SizedBox(
          height: 47,
          width: 150,
          child: Image.asset(
            "assets/images/e-medlogo.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
