import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proyecto_covidecuador/ui/constants/constants.dart';

class Header extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBot;

  const Header({Key key, this.image, this.textTop, this.textBot})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 10, right: 20),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/virus.png'),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: [
                Colors.teal[200],
                Colors.teal[200],
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 15.0,
                      child: SvgPicture.asset(
                        image,
                        width: 200,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: -8,
                        left: 140,
                        child: Text("$textTop\n$textBot",
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.white))),
                    Container(),
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

class MyClipper extends CustomClipper<Path> {
  @override
  /*Añade un segmento bezier cuadrático que se curva desde el punto actual
   hasta el punto dado (x2,y2), utilizando el punto de control (x1,y1). */
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
