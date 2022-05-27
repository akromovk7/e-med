import 'package:flutter/material.dart';
import 'package:med_app/screens/auth/view/auth_view.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute.init();
  static MyRoute get instace => _instance;
  MyRoute.init();

  Route? myRoutes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/statecontroller":
        return easynavigate(AuthView());
      
    }
  }

  easynavigate(Widget page) => MaterialPageRoute(builder: (context) => page);
}
