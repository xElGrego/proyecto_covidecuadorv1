import 'package:flutter/material.dart';
import 'package:proyecto_covidecuador/ui/constants/constants.dart';
import 'package:proyecto_covidecuador/ui/widgets/header.dart';
import 'package:proyecto_covidecuador/ui/widgets/prevente_card.dart';
import 'package:proyecto_covidecuador/ui/widgets/sintomas.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(
              image: "assets/icons/coronadr.svg",
              textTop: "Conoce más sobre",
              textBot: "el Covid-19.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sintomas",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/headache.png",
                          title: "Dolor de cabeza",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/caugh.png",
                          title: "Resfriado",
                        ),
                        SymptomCard(
                          image: "assets/images/fever.png",
                          title: "Fiebre",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Tips ", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                        "Las mascarillas ayudan a frenar la transmisión del COVID-19.",
                    image: "assets/images/wear_mask.png",
                    title: "Lleva mascarilla",
                  ),
                  PreventCard(
                    text:
                        "Mantener las manos limpias es una de las medidas más importantes que podemos adoptar para evitar contagiarnos y propagar el COVID-19",
                    image: "assets/images/wash_hands.png",
                    title: "Lava tus manos",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
