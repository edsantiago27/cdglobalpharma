import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:cdglobalpharma/src/pages/home_page.dart';
import 'package:cdglobalpharma/src/providers/provider_inpre.dart';
import 'package:cdglobalpharma/src/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'pedidos_page.dart';

class IniciarPrep extends StatefulWidget {
  // IniciarPrep({Key key}) : super(key: key);
  String folio;
  IniciarPrep(this.folio);
  @override
  _IniciarPrepState createState() => _IniciarPrepState();
}

class _IniciarPrepState extends State<IniciarPrep> {
  /**************EJEMPLIFICAR EL COMBOBOX DE LOTE******************/
  static const menuItems = <String>[
    'lote1',
    'lote2',
    'lote3',
    'lote4',
  ];
  final List<DropdownMenuItem<String>> _listadoMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'lote1';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  /*********************VARIABLES DE LA CLASE DTS***************************/

  var dts = DTS();
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  ScanButton scanButton;
  final TextEditingController controller =
      TextEditingController(text: 'barcodeScanRes');

  @override
  Widget build(BuildContext context) {
    List<InprepedModel> data;

    getPrep() {
      ProviderInpre.listInpre().then((value) {
        Iterable list = json.decode(value.body);
        List<InprepedModel> inpreList = List<InprepedModel>();
        inpreList = list.map((e) => InprepedModel.fromJson(e)).toList();

        if (data == null) {
          Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return data = inpreList;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Start Picking'),
        actions: [
          IconButton(
              tooltip: 'Scan BARCODE',
              icon: const Icon(Icons.filter_center_focus),
              color: Colors.red,
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#1ED760', 'Cancelar', false, ScanMode.BARCODE);
                return barcodeScanRes;
              }),
        ],
      ),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Folio #  ' + widget.folio,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[600],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller,
                  maxLength: 15,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.qr_code,
                        color: Colors.grey,
                      ),
                      hintText: 'Scaneando...',
                      labelText: 'Código barra material'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLength: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.exposure_plus_1,
                        color: Colors.grey,
                      ),
                      hintText: 'Indique cantidad...',
                      labelText: 'Cantidad:'),
                ),
                Container(
                  width: 20,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 4.0,
                          offset: Offset(0.0, 1.0))
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 8.0,
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {},
                        color: Colors.amber,
                      ),
                      Text(
                        '0',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  //maxLength: 4,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.my_location,
                        color: Colors.grey,
                      ),
                      hintText: 'Ubicación...',
                      labelText: 'Ubicación:'),
                ),
                ListTile(
                  title: const Text('Lote Disponible:'),
                  trailing: DropdownButton(
                    value: _btn2SelectedVal,
                    items: _listadoMenuItems,
                    onChanged: (String newValue) {
                      setState(() {
                        _btn2SelectedVal = newValue;
                      });
                    },
                    hint: const Text('Lote'),
                  ),
                ),
                RaisedButton.icon(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  onPressed: () {
                    print(data);
                  },
                  elevation: 4.0,
                  color: Colors.amber,
                  icon: Icon(Icons.check_circle),
                  label: Text('¿Confirma Producto? OK'),
                ),
              ],
            ),
          ),
          data == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      header: Text('Preparación'),
                      columns: [
                        DataColumn(label: Text('CodB')),
                        DataColumn(label: Text('Cant')),
                        DataColumn(label: Text('Ubic')),
                        DataColumn(label: Text('Lot')),
                        DataColumn(label: Text('Bod')),
                      ],
                      source: dts,
                      onRowsPerPageChanged: (r) {
                        setState(() {
                          _rowsPerPage = r;
                        });
                      },
                      rowsPerPage: _rowsPerPage,
                    ),
                  ),
                ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 2.0),
            child: Column(
              children: [
                Row(
                  children: [
                    RaisedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                                  title: new Text("Confirmar Preparación"),
                                  content: new Text(
                                      "¿Seguro confirmar preparación?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Guardar!'),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return new HomePage();
                                        }));
                                      },
                                    )
                                  ],
                                ));
                      },
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      color: Colors.amber,
                      icon: Icon(Icons.save_alt),
                      label: Text('¿Picking OK?'),
                    ),
                    Spacer(),
                    RaisedButton.icon(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => new AlertDialog(
                                  title: new Text("Cancelar Preparación"),
                                  content: new Text(
                                      "¿Seguro desea cancelar preparación?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancelar!'),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return new PreparacionesPage();
                                        }));
                                      },
                                    )
                                  ],
                                ));
                      },
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      color: Colors.amber,
                      icon: Icon(Icons.cancel),
                      label: Text('Cancelar'),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class DTS extends DataTableSource {
  List<InprepedModel> data;
  getPrep() {
    ProviderInpre.listInpre().then((response) {
      Iterable list = json.decode(response.body);
      List<InprepedModel> inpreList = List<InprepedModel>();
      inpreList = list.map((e) => InprepedModel.fromJson(e)).toList();

      if (data == null) {
        Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return data = inpreList;
      }
    });
  }

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(data[index].codigob)),
      DataCell(Text(data[index].cantPed.toString())),
      DataCell(Text(data[index].ubicacion)),
      DataCell(Text(data[index].lote)),
      DataCell(Text(data[index].bodega)),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 5;

  @override
  int get selectedRowCount => 0;
}
