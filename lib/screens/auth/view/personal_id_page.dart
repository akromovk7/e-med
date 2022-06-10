import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:med_app/core/components/box_dec.dart';
import 'package:med_app/core/components/button_styles.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/font_const.dart';
import 'package:med_app/core/widgets/app_bar_widget.dart';
import 'package:med_app/screens/auth/cubit/auth_cubit.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalIdPage extends StatelessWidget {
  const PersonalIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: AppBarWidget(
                text: "Your Personal ID",
                onTap: () =>
                    context.read<AuthCubit>().changeState(AuthConfirmation()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(height: context.height * 0.1),
                      SvgPicture.asset("assets/icons/logoid.svg"),
                      SizedBox(height: context.height * 0.04),
                      SizedBox(
                        width: context.width,
                        child: Text(
                          "Doctors use your ID to have an access to your\nmedical informations. We have sent this ID and your password to your number so you don’t forget them",
                          style: TextCustom.textDesign(
                              fontsize: FontConst.kExtraMediumFont,
                              color: ConsColors.kGrey,
                              height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: context.height * 0.04),
                      SizedBox(
                        width: context.width,
                        child: Text(
                          "Your ID",
                          style: TextCustom.textDesign(),
                        ),
                      ),
                      SizedBox(height: context.height * 0.01),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: context.height * 0.07,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              alignment: Alignment.centerLeft,
                              decoration: BoxStyle.decor(ConsColors.kMediumGrey,
                                  topLeft: 10.0, bottomLeft: 10.0),
                              child: Text(
                                "31012000",
                                style: TextCustom.textDesign(),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: context.height * 0.07,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              alignment: Alignment.center,
                              decoration: BoxStyle.decor(ConsColors.kWhite,
                                  topRight: 10.0, bottomRight: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Copy",
                                    style: TextCustom.textDesign(),
                                  ),
                                  SizedBox(
                                    width: context.width * 0.01,
                                  ),
                                  const Icon(
                                    Icons.copy_outlined,
                                    size: 12.0,
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("ID code copied"),
                                  duration: const Duration(milliseconds: 1500),
                                  width: 280.0.w,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: ConsColors.kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ButtonStyles.elevetedStyle(
            context: context, height: 54.h, width: 336.w),
        child: const Text("GO to your account"),
      ),
    );
  }
}
