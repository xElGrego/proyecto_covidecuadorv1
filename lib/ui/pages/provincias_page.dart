import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_covidecuador/domain/controllers/provincia_controller.dart';

import 'package:proyecto_covidecuador/ui/constants/constants_provincias.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:proyecto_covidecuador/ui/widgets/box_infects_provincias.dart';

class ProvinciasPage extends StatelessWidget {
  final _controller = Get.put(ProvinciasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Información de provincias",
            style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Obx(() {
            return _controller.loadingprovincias.value
                ? Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 15),
                        Text("Cargando resultados...",
                            style: Theme.of(context).textTheme.caption)
                      ],
                    ),
                  )
                : _listadoProvincias();
          }),
        ),
      ),
    );
  }

  Widget _listadoProvincias() {
    return Swiper(
      itemHeight: 300,
      outer: true,
      itemWidth: 350,
      layout: SwiperLayout.STACK,
      fade: 2.0,
      viewportFraction: -10.0,
      itemCount: _controller.provincias.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[100],
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: ClipRRect(
            child: Stack(
              children: [
                Row(
                  children: [
                    Text(
                      listprovincia[index].namepresentation,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        fit: BoxFit.cover,
                        width: 150,
                        image: AssetImage(listprovincia[index].photo),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Positioned(
                  bottom: 15,
                  child: Row(
                    children: [
                      BoxInfectsProvincias(
                        title: 'Fallecidos',
                        color: Colors.red,
                        number: _controller.provincias[index].fallecidos,
                      ),
                      BoxInfectsProvincias(
                        title: 'Fallecidos \nprobables',
                        color: Colors.orange,
                        number:
                            _controller.provincias[index].fallecidosProbables,
                      ),
                      BoxInfectsProvincias(
                        title: 'Total de \ncasos',
                        color: Colors.orange[900],
                        number: _controller.provincias[index].totalCasos,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
