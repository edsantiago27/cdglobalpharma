import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:cdglobalpharma/src/models/model_picking.dart';

import 'package:cdglobalpharma/src/providers/provider_codb.dart';
import 'package:cdglobalpharma/src/providers/provider_inpre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'checkout_pages.dart';
import 'pedidos_page.dart';

class IniciarPrep extends StatefulWidget {
  // IniciarPrep({Key key}) : super(key: key);
  String folio;
  String codigob;
  IniciarPrep(this.folio);
  @override
  _IniciarPrepState createState() => _IniciarPrepState();
}

class _IniciarPrepState extends State<IniciarPrep> {
  /**************EJEMPLIFICAR EL COMBOBOX DE LOTE******************/
  // static const menuItems = <String>[
  //   'lote1',
  //   'lote2',
  //   'lote3',
  //   'lote4',
  // ];
  // final List<DropdownMenuItem<String>> _listadoMenuItems = menuItems
  //     .map(
  //       (String value) => DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       ),
  //     )
  //     .toList();

  String _btn1SelectedVal;
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  /******************************************************/

  List<PickingModel> dataLote;
  cargaLote() {
    ProviderInpre.cargaLotes(folio, controller.text).then((value) {
      Iterable list = jsonDecode(value.body);
      List<PickingModel> listLote = List<PickingModel>();
      listLote = list.map((e) => PickingModel.fromJson(e)).toList();
      if (listLote != null) {
        setState(() {
          dataLote = listLote;
        });
      }
    });
  }

  final List<DropdownMenuItem> _listadoLotes = dataLote
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: Text(value.lote),
        ),
      )
      .toList();

  /******************METODO PARA SCAN Y ENVIO DE CONTROLER CON VALOR************************* */

  String _scanResult;

  final TextEditingController controller = TextEditingController();

  Future<void> _scanCode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#1ED760', 'Cancelar', false, ScanMode.BARCODE);

    setState(() {
      _scanResult = barcodeScanRes;
      controller.text = _scanResult;
    });
  }

/****************************************************************************/
  List<InprepedModel> data;
  String folio;
  getPrep() {
    ProviderInpre.inpreParam(widget.folio).then((value) {
      //print(jsonDecode(value.body));
      Iterable list = jsonDecode(value.body);
      List<InprepedModel> inpreList = List<InprepedModel>();
      inpreList = list.map((e) => InprepedModel.fromJson(e)).toList();
      //print(inpreList);
      if (inpreList != null) {
        setState(() {
          data = inpreList;
        });
      }
    });
  }

  dynamic detalle;
  loadDataByCode(String code, BuildContext context) {
    print('loadDataByCode ===> ' + code);
    ProviderCodB.simacodList(code).then((value) {
      print('se obtienen los datos en simacodList ===> ');
      if (value != null) {
        print('value is not null ===> ' + value.toString());
        if (!value['existe']) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                  'El código de barra no se encuentra en la base de datos',
                ),
                actions: [
                  TextButton(
                    child: Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getPrep();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Start Picking'),
        ),
        actions: [
          IconButton(
              tooltip: 'Scan BARCODE',
              icon: const Icon(Icons.filter_center_focus),
              color: Colors.red,
              onPressed: () async {
                _scanCode();
              }),
        ],
      ),
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
                  enabled: true,
                  autofocus: true,
                  autocorrect: false,
                  controller: controller,
                  maxLength: 15,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    loadDataByCode(value, context);
                  },
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
                    value: dataLote,
                    items: _listadoLotes,
                    onChanged: (value) {
                      setState(() {
                        dataLote = value;
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
              : buildDatatable(),
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
                                      child: Text('Ir a Checkout..!'),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return new CheckoutPage(widget.folio);
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
                      //DataCell(Text(data.)),
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
