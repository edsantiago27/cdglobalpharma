import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ProviderCodB extends ChangeNotifier {
  static String url = 'http://192.168.0.4:8182/api';

  static final codburl = '$url/simacodb';

  //METODO GET INPREPED
  static Future simacodList(String code) async {
    const response = {'existe': true};
    //return await http.get(url);
    return Future.value(response);
  }
}