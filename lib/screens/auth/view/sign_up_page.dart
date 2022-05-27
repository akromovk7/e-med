import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/core/components/button_styles.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/components/validator_comp.dart';
import 'package:med_app/core/constants/radius_const.dart';
import 'package:med_app/core/widgets/app_bar_widget.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:med_app/core/widgets/text_form_widget.dart';
import 'package:med_app/screens/auth/cubit/auth_cubit.dart';
import 'package:med_app/core/constants/icon_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

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
              child: AppBarWidget(onTap: () {
                context.read<AuthCubit>().changeState(AuthInitial());
              }),
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
                          Text(
                              'Sign up in order to get a full access to the system',
                              style: TextCustom.textDesign(),
                              textAlign: TextAlign.center),
                          SizedBox(height: context.height * 0.04),
                          Text("Full name", style: TextCustom.textDesign()),
                          SizedBox(height: context.height * 0.01),
                          MyTextField.textField(
                              text: "Enter your full name...",
                              controller: nameController,
                              validator: ValidatorController.nameValidator),
                          SizedBox(height: context.height * 0.04),
                          Text("Phone number", style: TextCustom.textDesign()),
                          SizedBox(height: context.height * 0.01),
                          MyTextField.textField(
                              text: "Enter your phone number...",
                              controller: phoneController,
                              validator: ValidatorController.phoneValidator),
                          SizedBox(height: context.height * 0.01),
                          Center(
                            child: Text(
                                "We will send confirmation code to this number",
                                style: TextCustom.textDesign()),
                          ),
                          SizedBox(height: context.height * 0.035),
                          Text("Create password",
                              style: TextCustom.textDesign()),
                          SizedBox(height: context.height * 0.01),
                          StatefulBuilder(builder: (context, setState) {
                            return MyTextField.textField(
                                isShown: context.watch<AuthCubit>().getShown,
                                text: "Enter your new password...",
                                controller: passwordController,
                                validator:
                                    ValidatorController.passwordValidator,
                                iconButton: IconButton(
                                    splashRadius: RadiuConst.small,
                                    onPressed: () {
                                      context.read<AuthCubit>().obSecure();
                                      setState(() {});
                                      // remove_red_eye icon will be worked with cubit
                                    },
                                    icon: Icon(ConsIcon.eye)));
                          }),
                          const Spacer(),
                          SizedBox(height: context.height * 0.04),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthCubit>().changeState(AuthConfirmation());
          }
        },
        child: const Text("Continue"),
        style: ButtonStyles.elevetedStyle(
            context: context, height: 54.h, width: 336.w),
      ),
    );
  }
}
