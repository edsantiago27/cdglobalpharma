import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_inprebkp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderInprebkp extends ChangeNotifier {
  //static String url = 'http://192.168.0.111:8183/api/';
  static String url = 'http://192.168.0.8:8182/api/';

  static final inprebkpUrl = '$url/inprebkps';

  //METODO GET INPREPED
  static Future listadoBkp() async {
    return await http.get(inprebkpUrl);
  }

  // metodo con parametro de id (folio) viene con cantNv > 0
  static Future listbkpByFolio(String folio) async {
    var response = await http.get('${url}inprebkps/$folio');
    return response;
  }

  // METODO POST PARA INSERTAR CADA ITEM CONFIRMADO
  static Future postItemBkp(InprebkpModel inprebkpModel) async {
    final endpoint =
        '$inprebkpUrl/post/${inprebkpModel.folio}/${inprebkpModel.codmp}';
    final resp =
        await http.post(endpoint, body: inprebkpModelToJson(inprebkpModel));
    final decodeData = jsonDecode(resp.body);
    print(decodeData);
    return decodeData;
  }
}
