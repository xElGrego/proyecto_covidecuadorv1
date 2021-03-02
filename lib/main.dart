import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto_covidecuador/ui/constants/constants.dart';
import 'package:proyecto_covidecuador/ui/pages/splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
  
    return GetMaterialApp(
      transitionDuration: Duration(seconds: 1.5.toInt()),
      defaultTransition: Transition.rightToLeftWithFade,
      title: 'Info Covid19 - Ecuador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: SplashPage(),
    );
  }
}
