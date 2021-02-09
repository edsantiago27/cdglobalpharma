import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/material.dart';

class ProviderPedidos extends ChangeNotifier {
  static String url = 'http://192.168.0.111:8183/api';
  // static String url = 'http://192.168.0.4:8182/api';

  static final pedidosUrl = '$url/pedidosasignadoes';

  static Future listPedidos() async {
    return await http.get(pedidosUrl);
  }
}
