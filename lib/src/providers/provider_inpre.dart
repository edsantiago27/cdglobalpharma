import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/cupertino.dart';

class ProviderInpre extends ChangeNotifier {
  static String url = 'http://192.168.0.5:80';

  static final inpreUrl = '$url/api/inprepeds';

  static Future listInpre() async {
    return await http.get(inpreUrl);
  }

  static Future detInpre() async {
    return await http.get('');
  }
}
