import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_inprebkp.dart';
import 'package:cdglobalpharma/src/providers/provider_inprebkp.dart';

import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  String folio;
  CheckoutPage(this.folio);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String folio;
  List<InprebkpModel> data;
  getBkp() {
    ProviderInprebkp.listbkpByFolio(folio).then((value) {
      Iterable list = jsonDecode(value.body);
      List<InprebkpModel> bkpList = List<InprebkpModel>();
      bkpList = list.map((e) => InprebkpModel.fromJson(e)).toList();
      if (bkpList == null) {
        setState(() {
          data = bkpList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getBkp();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Checkout'),
        ),
        actions: [
          IconButton(
            tooltip: 'Confirmar Preparación',
            icon: Icon(Icons.check),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Folio #  ' , //+ folio,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[600],
              ),
            ),
          ),
          data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : buildDatatable(),
        ],
      ),
    );
  }

  Widget buildDatatable() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                numeric: false,
                label: Text(
                  'Código B',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cantidad P',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Ubicación',
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
                        Text(data.codigob),
                        showEditIcon: true,
                        onTap: () {
                          // folio = data.folio.toString();
                          // if (widget.folio == data.folio) {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (BuildContext context) {
                          //     return new IniciarPrep(widget.folio);
                          //   }));
                          // } else {
                          //   showDialog(
                          //       context: context,
                          //       barrierDismissible: false,
                          //       builder: (BuildContext context) {
                          //         return AlertDialog(
                          //           title: Text('Error'),
                          //         );
                          //       });
                          // }
                        },
                      ),

                      DataCell(Text(data.cantNv.toString())),
                      DataCell(Text(data.ubicacion)),
                      DataCell(Text(data.lote)),
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