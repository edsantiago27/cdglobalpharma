import 'package:cdglobalpharma/src/models/model_inpreped.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderInpre extends ChangeNotifier {
  static String url = 'http://192.168.0.3:80';

  static final inpreUrl = '$url/api/inprepeds';

  //METODO GET INPREPED
  static Future listInpre() async {
    return await http.get(inpreUrl);
  }

  // metodo con parametro de id (folio)
  static Future inpreParam(String folio) async {
    var response = await http.get('$url/api/inprepeds/$folio');
    return response;
  }
}
