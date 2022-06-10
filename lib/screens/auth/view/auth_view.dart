import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_app/core/base/base_view/base_view.dart';
import 'package:med_app/screens/auth/cubit/auth_cubit.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';
import 'package:med_app/screens/auth/view/confirmation_page.dart';
import 'package:med_app/screens/auth/view/initial_page.dart';
import 'package:med_app/screens/auth/view/login_page.dart';
import 'package:med_app/screens/auth/view/personal_id_page.dart';
import 'package:med_app/screens/auth/view/sign_up_page.dart';
import 'package:med_app/screens/splash/splash_screen.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: scafold(),
    );
  }

  Scaffold scafold() {
    return Scaffold(
      body: BaseView(
          viewModel: AuthView,
          OnPageBuilder: (context, widget) {
            return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if (state is AuthSplash) {
                return const SplashScreenPage();
              } else if (state is AuthInitial) {
                return const InitialPage();
              } else if (state is AuthSignUP) {
                return SignUpPage();
              } else if (state is AuthSignIN) {
                return LoginPage();
              } else if (state is AuthConfirmation) {
                return const ConFirmationPage();
              } else if (state is AuthId) {
                return const PersonalIdPage();
              } else {
                return Container();
              }
            });
          }),
    );
  }
}
