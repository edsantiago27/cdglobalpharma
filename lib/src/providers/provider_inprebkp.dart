import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderInprebkp extends ChangeNotifier {
  static String url = 'http://192.168.0.3:8182/api/';

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
}
