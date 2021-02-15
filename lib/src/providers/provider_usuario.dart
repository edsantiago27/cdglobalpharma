import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  static Future login(String usuario, String password) async {
    try {
<<<<<<< HEAD
      var resp = await http
          .get('http://192.168.0.4:8182/api/lgpersons/$usuario/$password');
=======
      final respuesta = {
        "Usuario": usuario,
        "U_Pass": password,
      };
      var resp = await http.get(
          'http://192.168.0.111:8183/api/lgpersons/${usuario}/${password}');
      // var resp = await http
      //.get('http://192.168.0.4:8182/api/lgpersons/${usuario}/${password}');
>>>>>>> 3307f9f9496a670d8699769054fb01b8c54318d7

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
