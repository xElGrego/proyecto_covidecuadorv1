import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proyecto_covidecuador/domain/controllers/splash_controller.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/ug.png',
                        width: 150,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      Image.asset(
                        'assets/images/filosofia.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  Text(
                    "Universidad de \n      Guayaquil",
                    style: (TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    semanticsLabel: 'Cargando...',
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Gregorio Avila ",
                            style: (TextStyle(
                              color: Colors.black,
                            )),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "-  Developer Frontend",
                            style: (TextStyle(
                              color: Colors.black,
                            )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Javier Chiquito",
                            style: (TextStyle(
                              color: Colors.black,
                            )),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "-  Developer Backend",
                            style: (TextStyle(
                              color: Colors.black,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
