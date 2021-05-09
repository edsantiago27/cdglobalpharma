import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CargaLotePicking extends StatefulWidget {
  //CargaLotePicking({Key key}) : super(key: key);
  String folio = '0000692172';
  String codigob = '7800041047629';
  CargaLotePicking(this.folio, this.codigob);
  @override
  _CargaLotePickingState createState() => _CargaLotePickingState();
}

class _CargaLotePickingState extends State<CargaLotePicking> {
  String folio = '0000692172';
  String codigob = '7800041047629';
  String _seleccion;

  List<InprepedModel> dataLote;
  List itemLote = List();
  Future getLote() async {
    var url = 'http://192.168.0.8:8182/picking/$folio';
    //var url = 'http://192.168.0.111:8183/picking/$folio';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        itemLote = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLote();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Lote Disponible:'),
      trailing: DropdownButton(
        items: itemLote.map((item) {
          return DropdownMenuItem(
            child: Text(item['lote']),
            value: item['lote'],
          );
        }).toList(), //this._listadoMenuItems,
        onChanged: (value) {
          setState(() {
            _seleccion = value;
          });
        },
        value: _seleccion,
        hint: const Text('Lote'),
      ),
    );
  }
}
