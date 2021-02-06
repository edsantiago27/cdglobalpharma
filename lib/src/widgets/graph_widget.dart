import 'package:flutter/material.dart';

class GraphicsLinesHome extends StatefulWidget {
  GraphicsLinesHome({Key key}) : super(key: key);

  @override
  _GraphicsLinesHomeState createState() => _GraphicsLinesHomeState();
}

class _GraphicsLinesHomeState extends State<GraphicsLinesHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 24.0, right: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Dia',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                'Mes',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Expanded(
                child: Text(
                  'Año',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        Container(
          width: double.infinity,
          height: 250.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              dayItem("Ene", 40),
              dayItem("feb", 45),
              dayItem("Mar", 50),
              dayItem("May", 55),
              dayItem("Jun", 60),
              dayItem("Jul", 50),
              dayItem("Ago", 55),
              dayItem("Sep", 60),
            ],
          ),
        ),
      ],
    );
  }

  Widget dayItem(String dia, int value) {
    var barHeight = 200.0 * value / 100.0;
    var offsetY = 200.0 - barHeight - 60.0;
    return Column(
      children: <Widget>[
        SizedBox(height: offsetY),
        Text(
          value.toString(),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: 2.0,
          height: barHeight,
          color: Colors.red,
        ),
        Text(
          dia,
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ],
    );
  }
}
