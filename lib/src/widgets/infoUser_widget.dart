import 'package:flutter/material.dart';

class InfoUserHome extends StatefulWidget {
  InfoUserHome({Key key}) : super(key: key);

  @override
  _InfoUserHomeState createState() => _InfoUserHomeState();
}

class _InfoUserHomeState extends State<InfoUserHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
      child: Container(
        width: double.infinity,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.amberAccent[100],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '999',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pedidos Asignados',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '999',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pedidos Preparados',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
