import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PedidosAsignados extends StatefulWidget {
  @override
  _PedidosAsignadosState createState() => _PedidosAsignadosState();
}

class _PedidosAsignadosState extends State<PedidosAsignados> {
  List<PedidosAsignadosModel> data = List<PedidosAsignadosModel>();

  Future<List<PedidosAsignadosModel>> tomar_pedido() async {
    var url = 'http://192.168.0.4:8182/api/pedidosasignadoes';
    var registros = List<PedidosAsignadosModel>();
    var response = await http.get(url).timeout(Duration(seconds: 90));
    if (response.statusCode == 200) {
      var datos = jsonDecode(response.body);
      for (datos in datos) {
        registros.add(PedidosAsignadosModel.fromJson(datos));
      }
    }

    return registros;
  }

  @override
  void initState() {
    super.initState();
    tomar_pedido().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Pedidos Asignados'),

          ),
      body: ListView.builder(
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? _searchBar() : _buildListaPedidos(index - 1);
          }),
    );
  }

  Widget _buildListaPedidos(index) {
    return Card(
      color: Colors.amberAccent,
      elevation: 3.0,
      child: ListTile(
        trailing: Icon(Icons.check),
        //title: Text('0136' + '    ' + 'JOSE GARCIA'),
        title: Text('Nombre: ' + data[index].desPer),
        subtitle: Text('Folio: ' +
            data[index].folio +
            '    ' +
            'NumPedido: ' +
            data[index].numPed +
            '    ' +
            'Bodega: ' +
            data[index].bodega +
            '    ' +
            data[index].status +
            '    ' +
            'Total Lin: ' +
            data[index].lineas.toString()),
        leading: new Icon(Icons.assignment_ind),
        onTap: () {
          //Navigator.pushNamed(context, 'picking_page');
        },
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
