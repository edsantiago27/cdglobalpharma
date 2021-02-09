import 'package:flutter/material.dart';
import 'package:cdglobalpharma/src/models/model_pedxasignar.dart';
import 'package:cdglobalpharma/src/providers/provider_pedxasignar.dart';
import 'dart:convert';

import 'finalAsignaOper_page.dart';

class AsignarPedidoPage extends StatefulWidget {
  @override
  _AsignarPedidoPageState createState() => _AsignarPedidoPageState();
}

class _AsignarPedidoPageState extends State<AsignarPedidoPage> {
  String folio;
  List<ModelsPedidosxAsignar> data;
  List<ModelsPedidosxAsignar> modelData;

  getPedidosxAsignar() {
    ProviderPedidosxAsignar.listaPedxAsignar().then((response) {
      Iterable list = json.decode(response.body);
      List<ModelsPedidosxAsignar> pxasiLis = List<ModelsPedidosxAsignar>();
      pxasiLis = list.map((e) => ModelsPedidosxAsignar.fromJson(e)).toList();
      setState(() {
        data = pxasiLis;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getPedidosxAsignar();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Asignar Preparaciones'),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.check),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return new AsignarOperador();
                }));
              }),
        ],
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : _buildDataBody(context),
    );
  }

  Widget _buildDataBody(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // OJO REVISAR AXIS.HORIZONTAL
      child: SingleChildScrollView(
        child: DataTable(
          columnSpacing: 20.5,
          showCheckboxColumn: true,
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Folio'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Estado'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Tipo'),
              numeric: false,
            ),
            DataColumn(
              label: Text('NumPed'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Lineas'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Cant'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Ret'),
              numeric: false,
            ),
            DataColumn(
              label: Text('Apellido'),
              numeric: false,
            ),
          ],
          rows: data
              .map(
                (data) => DataRow(
                  //selected: modelData.contains(data),
                  onSelectChanged: (data) {
                    //modelData = data;
                  },
                  cells: <DataCell>[
                    DataCell(
                      Text(data.folio),
                    ),
                    DataCell(Text(data.estado)),
                    DataCell(Text(data.tipo)),
                    DataCell(Text(data.numPed)),
                    DataCell(Text(data.lineas.toString())),
                    DataCell(Text(data.unidades.toString())),
                    DataCell(Text(data.retenido.toString())),
                    DataCell(Text(data.apellidos)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
