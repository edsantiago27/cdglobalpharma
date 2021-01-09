import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<PedidosAsignadosModel> data = List<PedidosAsignadosModel>();
  Future<List<PedidosAsignadosModel>> tomar_pedido() async {
    var url = 'http://192.168.0.5/api/pedidosasignadoes';
    var response = await http.post(url).timeout(Duration(seconds: 90));
    var datos = jsonDecode(response.body);
    var registros = List<PedidosAsignadosModel>();
    for (datos in datos) {
      registros.add(PedidosAsignadosModel.fromJson(datos));
    }
    return registros;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tomar_pedido().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPage'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.amberAccent,
                child: ListTile(
                  title: Text(data[index].folio),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
