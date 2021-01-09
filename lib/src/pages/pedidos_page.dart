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
  List<PedidosAsignadosModel> pedidos;
  getPedidoAsignado() {
    Provider.listPedidos().then((response) {
      Iterable list = json.decode(response.body);
      List<PedidosAsignadosModel> pedidosList = List<PedidosAsignadosModel>();
      pedidosList =
          list.map((model) => PedidosAsignadosModel.fromJson(model)).toList();
      setState(() {
        pedidos = pedidosList;
      });
    });
  }

  final pedidosProvider = new Provider();
  PedidosAsignadosModel pedidosAsignados = new PedidosAsignadosModel();

  @override
  Widget build(BuildContext context) {
    PedidosAsignadosModel pedidosData =
        ModalRoute.of(context).settings.arguments;
    if (pedidosAsignados != null) {
      pedidosAsignados = pedidosData;
    }
    getPedidoAsignado();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Asignados'),
      ),
      body: pedidos == null
          ? Center(child: CircularProgressIndicator())
          : _builPedidosList(),
      floatingActionButton: _btnPicking(context),
    );
  }

  Widget _builPedidosList() {
    return ListView.builder(
        itemCount: pedidos.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amberAccent,
            elevation: 3.0,
            child: ListTile(
              trailing: Icon(Icons.check_box),
              //title: Text('0136' + '    ' + 'JOSE GARCIA'),
              title: Text('Nombre: '),
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
              leading: new Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, 'picking_page',
                    arguments: pedidosAsignados);
              },
            ),
          );
        });
  }

  Widget _btnPicking(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {});
  }
}
