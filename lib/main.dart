import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto_covidecuador/ui/constants/constants.dart';
import 'package:proyecto_covidecuador/ui/pages/splash.dart';

import 'domain/controllers/covid_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.put(CovidController());
    return GetMaterialApp(
      title: 'Grego Covid App',
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
