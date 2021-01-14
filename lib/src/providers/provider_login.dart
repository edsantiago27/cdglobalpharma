import 'dart:convert';
export 'package:cdglobalpharma/src/bloc/login_bloc.dart';
import 'package:cdglobalpharma/src/bloc/login_bloc.dart';
import 'package:cdglobalpharma/src/models/model_lgperson.dart';
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/pages/pedidos_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Provider extends InheritedWidget {
  //static String url = 'http://192.168.0.111:8183';
  static String url = 'http://192.168.0.5:80';
  PedidosAsignadosModel data;
  //************************************************** */
  static Provider _instancia;
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(
        key: key,
        child: child,
      );
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

//*************************LGPERSON***************************** */

  static final listUrl = '$url/api/lgpersons';

  // METODO PARA MOSTRAR LSTADO DE LGPERSONS
  static Future listUser() async {
    return await http.get(listUrl);
  }

  static Future<bool> editUser(LgpersonModel lgperson) async {
    final urledit = '$url/api/lgpersons/${lgperson.codPer}';
    final resp = await http.put(urledit, body: usersModelToJson(lgperson));
    final decodeData = json.decode(resp.body);
    return true;
  }

//************************PEDIDO ASIGNADOS************************** */
  static final pedidosUrl = '$url/api/pedidosasignadoes';

  static Future listPedidos() async {
    return await http.get(pedidosUrl);
  }

  static Future<bool> editPedidosA(
      PedidosAsignadosModel pedidosAsignados) async {
    final urleditpa = '$url/api/pedidosasignadoes/${pedidosAsignados.codPer}';
    final resp = await http.put(urleditpa,
        body: pedidosAsignadosModelToJson(pedidosAsignados));
    final decodepaData = json.decode(resp.body);
    return true;
  }

  
  //****************************************************************** */
}
