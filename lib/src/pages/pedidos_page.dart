import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

class PedidosAsignados extends StatefulWidget {
  final lgpersonProvider = new Provider();
  @override
  _PedidosAsignadosState createState() => _PedidosAsignadosState();
}

class _PedidosAsignadosState extends State<PedidosAsignados> {
  List<PedidosAsignadosModel> pedidoasignado;
  getPedidoAsignado() {
    Provider.listPedidos().then((response) {
      Iterable list = json.decode(response.body);
      List<PedidosAsignadosModel> pedidosList = List<PedidosAsignadosModel>();
      pedidosList =
          list.map((model) => PedidosAsignadosModel.fromJson(model)).toList();
      setState(() {
        pedidoasignado = pedidosList;
      });
    });
  }

  final pedidosProvider = new Provider();
  //PedidosAsignadosModel pedidoasignado = new PedidosAsignadosModel();

  @override
  Widget build(BuildContext context) {
    getPedidoAsignado();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Asignados'),
      ),
      body: pedidoasignado == null
          ? Center(child: CircularProgressIndicator())
          : _builPedidosList(),
    );
  }

// card de ejemplo para ver en listas.
  Widget _builPedidosList() {
    return ListView.builder(
      itemCount: pedidoasignado.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blueGrey[100],
          elevation: 3.0,
          child: ListTile(
            leading: new Icon(Icons.arrow_drop_down),
            //title: Text(pedidoasignado[index].desPer),
            // subtitle: Text(pedidoasignado[index].codPer),
            onTap: () {},
          ),
        );
      },
    );
  }
}
