import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderInpre extends ChangeNotifier {
  //static String url = 'http://192.168.0.111:8183/api/';
  static String url = 'http://192.168.0.4:8182/api/';

  static final inpreUrl = '$url/inprepeds';

  //METODO GET INPREPED
  static Future listInpre() async {
    return await http.get(inpreUrl);
  }

  // metodo con parametro de id (folio) viene con cantNv > 0
  static Future inpreParam(String folio) async {
    var response = await http.get('${url}inprepeds/$folio');
    return response;
  }

  // carga de api con dos modelos inpreped y simaprod
  static Future cargaData(String folio) async {
    //var response = await http.get('http://192.168.0.111:8183/proceso/$folio');
    var response = await http.get('http://192.168.0.4:8182/proceso/$folio');
    if (response == null) {
      return false;
    }
    return response;
  }

  // metodo para cargar las ubicaciones

  static Future cargaUbicacion(String folio) async {

    var response =
        await http.get('http://192.168.0.4:8182/api/inprepeds/ubica/$folio');

    //var response = await http
       // .get('http://192.168.0.111:8183/api/inprepeds/ubica/$folio');
    //var response = await http.get('http://192.168.0.4:8182/api/inprepeds/ubica/${folio}');

    // if (response == null) {
    //   return false;
    // }
    return response;
  }

  // metodo para cargar los lotes

  static Future cargaLotes(String folio, String codigob) async {
    //var response = await http.post('http://192.168.0.111:8183/picking/');
    var response = await http.post('http://192.168.0.4:8182/picking/');
    return response;
  }
}
