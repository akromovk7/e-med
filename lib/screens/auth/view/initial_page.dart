import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_app/core/base/base_view/size_extension.dart';
import 'package:med_app/core/components/button_styles.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/font_const.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConsColors.kWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.0944527736,
                    width: context.width * 0.5333333333,
                    child: Image.asset(
                      "assets/images/blueLogo.png",
                      // fit: BoxFit.cover,
                    ),
                  ),
                  sizedBox(62.0),
                  Text(
                    "Your medical data\nis always with you",
                    style: TextCustom.textDesign(
                        letterSpacing: -2,
                        fontsize: FontConst.kExtraLargeFont.sp),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Nunc orci sed sed posuere volutpat varius\negestas sit. Amet, suscipit eget dis fusce\nquam in aliquet pulvinar.",
                    style: TextCustom.textDesign(
                        height: 2,
                        fontsize: FontConst.kMediumFont.sp,
                        color: ConsColors.kGrey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Get Started",
                      style: TextCustom.textDesign(
                          color: ConsColors.kWhite,
                          fontsize: FontConst.kMediumFont.sp),
                    ),
                    style: ButtonStyles.elevetedStyle(
                      context: context,
                      width: 336.w,
                      height: 54.h,
                    ),
                  ),
                  sizedBox(16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Log in",
                      style: TextCustom.textDesign(
                          color: ConsColors.kPrimaryColor,
                          fontsize: FontConst.kMediumFont.sp),
                    ),
                    style: ButtonStyles.elevetedStyle(
                      onPrimary: ConsColors.kPrimaryColor,
                      backgroundcolor: ConsColors.kWhite,
                      borderColor: ConsColors.kPrimaryColor,
                      context: context,
                      width: 336.w,
                      height: 54.h,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox sizedBox(double size) => SizedBox(
        height: ScreenUtil().setHeight(size),
      );
}
