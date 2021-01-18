import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/providers/provider_inpre.dart';
import 'package:flutter/material.dart';

class PreparacionPage extends StatefulWidget {
  // PreparacionPage({Key key}) : super(key: key);

  @override
  _PreparacionPageState createState() => _PreparacionPageState();
}

class _PreparacionPageState extends State<PreparacionPage> {
  List<InprepedModel> data;
  getInpre() {
    ProviderInpre.listInpre().then((value) {
      Iterable list = json.decode(value.body);
      List<InprepedModel> inpreLista = List<InprepedModel>();
      inpreLista = list.map((e) => InprepedModel.fromJson(e)).toList();
      setState(() {
        data = inpreLista;
      });
    });
  }

  final providers = new ProviderInpre();
  PedidosAsignadosModel preparacion = PedidosAsignadosModel();
  InprepedModel inpreList = new InprepedModel();

  @override
  Widget build(BuildContext context) {
    getInpre();
    PedidosAsignadosModel pedidosig = ModalRoute.of(context).settings.arguments;
    if (preparacion != null) {
      preparacion = pedidosig;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Preparación'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : _detailPrep(context),
    );
  }

  Widget _headPrep(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Preparación: '),
          TextFormField(
              //initialValue: pedidos.folio,
              )
        ],
      ),
    );
  }

  Widget _detailPrep(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                numeric: false,
                label: Text(
                  'Cod EAN',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Desc',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cant',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Lote',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Ubic',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: data
                .map(
                  (data) => DataRow(
                    //onSelectChanged: (data) => pedidos,
                    cells: <DataCell>[
                      DataCell(Text(data.codigob)),
                      DataCell(Text(data.bodega)),
                      DataCell(Text(data.numPed)),
                      DataCell(Text(data.codmp)),
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
