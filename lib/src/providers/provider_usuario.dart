import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UsuarioProvider {
  static Future login(String usuario, String password) async {
    var resp = await http.post('http://192.168.0.3:8182/login');
    return resp;
  }
}
