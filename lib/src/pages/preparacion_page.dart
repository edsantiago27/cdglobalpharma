import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:cdglobalpharma/src/models/model_simaprod.dart';
import 'package:cdglobalpharma/src/providers/provider_inpre.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IniciarPrep extends StatefulWidget {
  IniciarPrep() : super();

  @override
  _IniciarPrepState createState() => _IniciarPrepState();
}

class _IniciarPrepState extends State<IniciarPrep> {
  List<InprepedModel> inpreped;
  List<ModelsSimaprod> simaprod;
  List<InprepedModel> selectedInpre;
  bool sort;
  bool selected;

  // Future<List<InprepedModel>> listarPreparacion() async {
  //   var url = 'http://192.168.0.3/api/inprepeds/0000689170';
  //   var reg = List<InprepedModel>();
  //   var resp = await http.get(url).timeout(Duration(seconds: 3));
  //   if (resp.statusCode == 200) {
  //     var datos = jsonDecode(resp.body);
  //     for (datos in datos) {
  //       reg.add(InprepedModel.fromJson(datos));
  //     }
  //   }
  //   return reg;
  // }

  // @override
  // void initState() {
  //   sort = false;
  //   selected = false;
  //   selectedInpre = [];
  //   //inpreped = ProviderInpre.listInpre();

  //   super.initState();
  //   listarPreparacion().then((value) {
  //     setState(() {
  //       inpreped.addAll(value);
  //     });
  //   });
  // }

  getPrep() {
    ProviderInpre.listInpre().then((value) {
      Iterable list = json.decode(value.body);
      List<InprepedModel> prep = List<InprepedModel>();
      prep = list.map((e) => InprepedModel.fromJson(e)).toList();
      setState(() {
        inpreped = prep;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search), color: Colors.white, onPressed: () {})
        ],
        title: Text('Iniciar Preparación'),
      ),
      body:
          // txtNumPrep(context) ,
          preparacion(context),
    );
  }

  Widget preparacion(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('CodB')),
            DataColumn(label: Text('Cant')),
            DataColumn(label: Text('Lin')),
            DataColumn(label: Text('Ubi')),
            DataColumn(label: Text('Lot')),
            DataColumn(label: Text('Des')),
          ],
          rows: inpreped
              .map(
                (inpreped) => DataRow(cells: <DataCell>[
                  DataCell(
                    Text(inpreped.codigob.toString()),
                  ),
                  DataCell(
                    Text(inpreped.cantPed.toString()),
                  ),
                  DataCell(
                    Text(inpreped.linPed.toString()),
                  ),
                  DataCell(
                    Text(inpreped.ubicacion),
                  ),
                  DataCell(
                    Text(inpreped.lote),
                  ),
                  DataCell(
                    Text(inpreped.status),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
