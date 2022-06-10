import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/core/components/button_styles.dart';
import 'package:med_app/core/components/masks.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/components/validator_comp.dart';
import 'package:med_app/core/constants/icon_const.dart';
import 'package:med_app/core/constants/radius_const.dart';
import 'package:med_app/core/widgets/app_bar_widget.dart';
import 'package:med_app/core/widgets/text_form_widget.dart';
import 'package:med_app/screens/auth/cubit/auth_cubit.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: AppBarWidget(
                text: "Log in",
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: SizedBox(
                height: context.height * 0.88,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.height * 0.04),
                        Center(
                          child: Text(
                            "Log in to your account",
                            style: TextCustom.textDesign(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: context.height * 0.04),
                        SizedBox(height: context.height * 0.04),
                        Text(
                          "Phone number",
                          style: TextCustom.textDesign(),
                        ),
                        SizedBox(height: context.height * 0.01),
                        MyTextField.textField(
                          keyboardType: TextInputType.number,
                          formatter: [Masks.instance.maks],
                          text: "Enter your phone number...",
                          controller: phoneController,
                          validator: ValidatorController.phoneValidator,
                        ),
                        SizedBox(height: context.height * 0.04),
                        Text("Your password", style: TextCustom.textDesign()),
                        SizedBox(height: context.height * 0.01),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return MyTextField.textField(
                              text: "Enter your new password...",
                              controller: passwordController,
                              validator: ValidatorController.passwordValidator,
                              isShown: context.watch<AuthCubit>().getShown,
                              iconButton: IconButton(
                                splashRadius: ConsRadius.medium,
                                onPressed: () {
                                  context.read<AuthCubit>().obSecure();
                                  setState(() {});
                                },
                                icon: const Icon(ConsIcon.eye),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: context.height * 0.04),
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        child: const Text("Log in"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthCubit>().changeState(AuthConfirmation());
          }
        },
        style: ButtonStyles.elevetedStyle(
            context: context, height: 54.h, width: 336.w),
      ),
    );
  }
}
