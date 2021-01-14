import 'package:cdglobalpharma/src/providers/provider_pedidos.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';

class PreparacionesPage extends StatefulWidget {
  //PreparacionesPage({Key key}) : super(key: key);

  @override
  _PreparacionesPageState createState() => _PreparacionesPageState();
}

class _PreparacionesPageState extends State<PreparacionesPage> {
  // Provider datas = new Provider();
  List<PedidosAsignadosModel> data;
  getPed() {
    ProviderPedidos.listPedidos().then((response) {
      Iterable list = json.decode(response.body);
      List<PedidosAsignadosModel> palist = List<PedidosAsignadosModel>();
      palist = list.map((e) => PedidosAsignadosModel.fromJson(e)).toList();
      setState(() {
        data = palist;
      });
    });
  }

  final paProvider = new ProviderPedidos();
  PedidosAsignadosModel pedidos = new PedidosAsignadosModel();

  @override
  Widget build(BuildContext context) {
    PedidosAsignadosModel pedidosig = ModalRoute.of(context).settings.arguments;
    if (pedidos != null) {
      pedidos = pedidosig;
    }
    getPed();
    return Scaffold(
      appBar: AppBar(
        title: Text('Picking start'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : buildDataBody(context),
    );
  }

  Widget buildDataBody(context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                numeric: false,
                label: Text(
                  'Folio',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Operador',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'NumPedido',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cant Lineas',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Bodega',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: data
                .map(
                  (data) => DataRow(
                    //onSelectChanged: (data) => pedidos,
                    cells: <DataCell>[
                      DataCell(
                        Text(data.folio),
                        showEditIcon: true,
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'preparacion',
                              arguments: pedidos.folio
                              );
                        },
                      ),
                      DataCell(Text(data.desPer)),
                      DataCell(Text(data.numPed)),
                      DataCell(Text(data.lineas.toString())),
                      DataCell(Text(data.bodega)),
                      // DataCell(ButtonBar()),
                    ],
                  ),
                )
                .toList(),
          ),
        ));
  }
}
