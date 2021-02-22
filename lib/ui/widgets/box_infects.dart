import 'package:flutter/material.dart';
import 'package:proyecto_covidecuador/ui/constants/constants.dart';

class BoxInfects extends StatelessWidget {
  final int number;
  final Color color;
  final String title;

  BoxInfects({Key key, this.number, this.color, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 45.0),
      child: Column(
        children: [
     
          Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: color.withOpacity(.26),
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$number',
            style: TextStyle(fontSize: 26, color: color),
          ),
          Text(
            title,
            style: kSubTextStyle,
          ),
        ],
      ),
    );
  }
}
