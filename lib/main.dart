import 'package:flutter/material.dart';
import 'package:med_app/core/components/theme_com.dart';
import 'package:med_app/routes/my_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-Med',
      theme: MyTheme.mytheme,
      onGenerateRoute: MyRoute.instace.myRoutes,
      initialRoute: '/splash'
    );});
  }
}
