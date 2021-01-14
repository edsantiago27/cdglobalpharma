import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/cupertino.dart';

class ProviderPedidos extends ChangeNotifier {
  static String url = 'http://192.168.0.5:80';

  static final pedidosUrl = '$url/api/pedidosasignadoes';

  static Future listPedidos() async {
    return await http.get(pedidosUrl);
  }
}
