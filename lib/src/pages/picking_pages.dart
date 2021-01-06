import 'package:flutter/material.dart';

class Picking extends StatefulWidget {
  Picking({Key key}) : super(key: key);

  @override
  _PickingState createState() => _PickingState();
}

class _PickingState extends State<Picking> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picking'),
      ),
    );
  }
}
