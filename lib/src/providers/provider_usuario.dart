import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  static Future login(String usuario, String password) async {
    try {
      var resp = await http
          .get('http://192.168.0.111:8183/api/lgpersons/$usuario/$password');
      // var resp = await http
      //   .get('http://192.168.0.4:8182/api/lgpersons/$usuario/$password');

      final decodeResp = json.decode(resp.body);

      if (resp.statusCode == 200) {
        print(decodeResp);
        return decodeResp;
      }
    } catch (e) {
      print(e);
    }
  }
}
