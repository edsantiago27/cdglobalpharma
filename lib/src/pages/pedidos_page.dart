import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

class PedidosAsignados extends StatefulWidget {
  final lgpersonProvider = new Provider();
  //PedidosAsignados({Key key}) : super(key: key);

  @override
  _PedidosAsignadosState createState() => _PedidosAsignadosState();
}

class _PedidosAsignadosState extends State<PedidosAsignados> {
  List<PedidosAsignadosModel> paList;
  getPedidoAsignado() {
    Provider.listPedidos().then((response) {
      Iterable list = json.decode(response.body);
      List<PedidosAsignadosModel> pedidosList = List<PedidosAsignadosModel>();
      pedidosList =
          list.map((model) => PedidosAsignadosModel.fromJson(model)).toList();
      setState(() {
        paList = pedidosList;
      });
    });
  }

  final pedidosProvider = new Provider();
  PedidosAsignadosModel pedidoasignado = new PedidosAsignadosModel();

  @override
  Widget build(BuildContext context) {
    PedidosAsignadosModel paData = ModalRoute.of(context).settings.arguments;
    if (pedidoasignado != null) {
      pedidoasignado = paData;
    }
    getPedidoAsignado();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Asignados'),
      ),
      body: paList == null
          ? Center(child: CircularProgressIndicator())
          : _builPedidosList(),
    );
  }

  Widget _builPedidosList() {
    return ListView.builder(
        itemCount: paList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amberAccent,
            elevation: 3.0,
            child: ListTile(
              leading: new Icon(Icons.person),
              trailing: Icon(Icons.check_box),
              title: Text('0136' + '    ' + 'JOSE GARCIA'),
              subtitle: Text('Folio: ' +
                  '0000692797' +
                  '    ' +
                  'NumPedido: ' +
                  '0000121690' +
                  '    ' +
                  'Bodega: ' +
                  '850' +
                  '    ' +
                  'Asignado' +
                  '    ' +
                  'Total Lin: ' +
                  '2'),
              onTap: () {
                Navigator.pushReplacementNamed(context, 'picking_page');
              },
            ),
          );
        });
  }
}
