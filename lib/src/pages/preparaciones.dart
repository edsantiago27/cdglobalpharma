import 'package:flutter/material.dart';

class PreparacionPage extends StatefulWidget {
  PreparacionPage({Key key}) : super(key: key);

  @override
  _PreparacionPageState createState() => _PreparacionPageState();
}

class _PreparacionPageState extends State<PreparacionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Preparación'),
      ),
    );
  }
}
