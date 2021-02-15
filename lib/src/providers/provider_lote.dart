import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderLote extends ChangeNotifier {
  //static String url = 'http://192.168.0.111:8183/';
  static String url = 'http://192.168.0.4:8182/';
  static final lotepUrl = '$url/picking';

  //METODO PARA VER PIKING/{FOLIO}
  static Future loteByPicking(String folio, String codigob) async {
    var response = await http.get('$url/picking/$folio');
    return response;
  }

  // Metodo para llamar a la ubicacion de codigob
  static Future ubicacionPorEan(String folio, String codigob) async {
    var response = await http.get('$url/picking/ubicacion/$codigob');
    return response;
  }
}
