import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderPedidosxAsignar extends ChangeNotifier {
  static String url = 'http://192.168.0.111:8183/api';
  //static String url = 'http://192.168.0.4:8182/api';

  static final pedidosUrl = '$url/pedidosporasignars';

  static Future listaPedxAsignar() async {
    return await http.get(pedidosUrl);
  }
}
