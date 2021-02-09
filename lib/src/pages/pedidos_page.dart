import 'package:flutter/material.dart';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/pages/preparacion_page.dart';
import 'package:cdglobalpharma/src/providers/provider_pedidos.dart';
import 'dart:convert';

class PreparacionesPage extends StatefulWidget {
  //PreparacionesPage({Key key}) : super(key: key);

  @override
  _PreparacionesPageState createState() => _PreparacionesPageState();
}

class _PreparacionesPageState extends State<PreparacionesPage> {
  //TextEditingController _nv;
  String folio;
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
    getPed();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Listado Picking',
        )),
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
                          folio = data.folio.toString();
                          if (folio == data.folio) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return new IniciarPrep(folio);
                            }));
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                  );
                                });
                          }
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
