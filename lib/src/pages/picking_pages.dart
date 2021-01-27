import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_picking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListPickingPage extends StatefulWidget {
  // ListPickingPage({Key key}) : super(key: key);

  @override
  _ListPickingPageState createState() => _ListPickingPageState();
}

class _ListPickingPageState extends State<ListPickingPage> {
  List<PickingModel> data = List<PickingModel>();

  Future<List<PickingModel>> verPiking() async {
    var url = 'http://192.168.0.3:8182/api/pickings';
    var registros = List<PickingModel>();
    var response = await http.get(url).timeout(Duration(seconds: 90));
    if (response.statusCode == 200) {
      var datos = jsonDecode(response.body);
      for (datos in datos) {
        registros.add(PickingModel.fromJson(datos));
      }
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    verPiking().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Picking'),
      ),
      body: ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? _searchBar() : _listaPicking(index - 1);
        },
      ),
    );
  }

  Widget _listaPicking(index) {
    return Card(
      color: Colors.amberAccent,
      elevation: 3.0,
      child: ListTile(
        title: Text('Folio: ' + data[index].folio.toString()),
        subtitle: Text('Pedido#  ' +
            data[index].numPed +
            ' ' +
            'Fecha: ' +
            data[index].fecha.toIso8601String() + ' '+ ''),
        onTap: () {},
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Buscar por folio...'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            data = data.where((registros) {
              var noteTitle = registros.folio.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}
