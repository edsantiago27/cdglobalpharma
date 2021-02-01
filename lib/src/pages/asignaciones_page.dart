import 'package:flutter/material.dart';

class AsignarPedidoPage extends StatefulWidget {
  AsignarPedidoPage({Key key}) : super(key: key);

  @override
  _AsignarPedidoPageState createState() => _AsignarPedidoPageState();
}

class _AsignarPedidoPageState extends State<AsignarPedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Asignar Preparaciones'),
        ),
      ),
      // body: ,
    );
  }
}
