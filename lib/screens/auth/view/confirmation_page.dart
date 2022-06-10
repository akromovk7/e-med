import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/core/components/button_styles.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/font_const.dart';
import 'package:med_app/core/constants/padmar_const.dart';
import 'package:med_app/core/widgets/app_bar_widget.dart';
import 'package:med_app/core/widgets/num_in_widget.dart';
import 'package:med_app/screens/auth/cubit/auth_cubit.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConFirmationPage extends StatelessWidget {
  const ConFirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              onTap: (() =>
                  context.read<AuthCubit>().changeState(AuthSignUP())),
            ),
            SizedBox(height: context.height * 0.03),
            Padding(
              padding: PadMarConst.Medium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: context.width * 0.9,
                      child: Text(
                        "We sent a confirmation code to your number.\nPlease, enter the code",
                        style: TextCustom.textDesign(
                            fontsize: FontConst.kExtraMediumFont,
                            color: ConsColors.kGrey,
                            height: 2.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.070,
                  ),
                  Text(
                    "Confirmation code",
                    style: TextCustom.textDesign(
                        fontsize: FontConst.kExtraMediumFont),
                  ),
                  SizedBox(height: context.height * 0.04),
                  SizedBox(
                    height: context.height * 0.07,
                    child: Row(
                      children: const [
                        NumInWidget(),
                        NumInWidget(),
                        NumInWidget(),
                        NumInWidget(),
                        NumInWidget(),
                        NumInWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.read<AuthCubit>().changeState(AuthId());
        },
        child: Text("Confirm"),
        style: ButtonStyles.elevetedStyle(
            context: context, height: 54.h, width: 336.w),
      ),
    );
  }
}
