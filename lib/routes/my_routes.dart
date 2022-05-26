import 'package:flutter/material.dart';
import 'package:med_app/screens/auth/view/initial_page.dart';
import 'package:med_app/screens/auth/view/sign_up_page.dart';
import 'package:med_app/screens/home/view/home_page.dart';
import 'package:med_app/screens/splash/splash_screen.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute.init();
  static MyRoute get instace => _instance;
  MyRoute.init();

  Route? myRoutes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return easynavigate(SplashScreenPage());
      case "/initial":
        return easynavigate(InitialPage());
      case "/signup":
        return easynavigate(SignUpPage());
      case "/login":
        return easynavigate(HomePage());
      case "/home":
        return easynavigate(HomePage());
    }
  }

  easynavigate(Widget page) => MaterialPageRoute(builder: (context) => page);
}
