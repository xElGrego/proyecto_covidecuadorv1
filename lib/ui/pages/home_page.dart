import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_covidecuador/data/models/covid.dart';
import 'package:proyecto_covidecuador/domain/controllers/covid_controller.dart';
import 'package:proyecto_covidecuador/ui/constants/constants.dart';
import 'package:proyecto_covidecuador/ui/pages/infoscreen_page.dart';
import 'package:proyecto_covidecuador/ui/pages/provincias_page.dart';
import 'package:proyecto_covidecuador/ui/widgets/box_infects.dart';
import 'package:proyecto_covidecuador/ui/widgets/header.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final controller = Get.put(CovidController());
  Covid covid = Covid();

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Info covid 19 - Ecuador"),
          backgroundColor: Colors.teal[200],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Header(
                  image: 'assets/icons/Drcorona.svg',
                  textBot: 'No salgas de casa',
                  textTop: 'Si no es necesario',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 130,
                      child: Obx(
                        () {
                          return controller.covidloading.value
                              ? Center(
                                  child: Column(
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(height: 15),
                                      Text(
                                        "Cargando resultados...",
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    BoxInfects(
                                      color: kInfectedColor,
                                      number: controller.covid.value.totalConfirmados,
                                      title: 'Infectados por covid',
                                    ),
                                    BoxInfects(
                                      color: kDeathColor,
                                      number: controller.covid.value.totalFallecidos,
                                      title: 'Total Fallecidos',
                                    ),
                                    BoxInfects(
                                      color: kRecovercolor,
                                      number: controller.covid.value.totalRecuperados,
                                      title: 'Total Recuperados',
                                    ),
                                    BoxInfects(
                                      color: Colors.yellow,
                                      number: controller.covid.value.totalMuestrasPcr,
                                      title: 'Total muestras CPR',
                                    ),
                                    BoxInfects(
                                      color: Colors.blue,
                                      number: controller.covid.value.totalConfirmados,
                                      title: 'Total Descartados',
                                    ),
                                    BoxInfects(
                                      color: Colors.teal,
                                      number: controller.covid.value.totalConfirmados,
                                      title: 'Total Alta Hospitalaria',
                                    ),
                                  ],
                                );
                        },
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Casos Actualizados\n",
                                style: kTitleTextstyle,
                              ),
                              TextSpan(
                                text: DateFormat.yMMMd().format(date),
                                style: TextStyle(
                                  color: kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(InfoPage(), transition: Transition.fadeIn);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              "¿Como prevenir?",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Text("Informacion mapaeada"),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(ProvinciasPage());
                          },
                          child: Text(
                            "Ver las provincias",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(.2)),
                      child: Image.asset(
                        'assets/images/mapaecuador.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      child: Text(
                        'Ver estadísticas COVID-19 ',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      onTap: () async {
                        const url =
                            'https://www.coronavirusecuador.com/estadisticas-covid-19/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw {print("Valimos")};
                        }
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
