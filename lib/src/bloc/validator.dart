import 'dart:async';

class Validators {
  final validarUsuario = StreamTransformer<String, String>.fromHandlers(
      handleData: (usuario, sink) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    if (usuario.length >= 10) {
      sink.add(usuario);
    } else {
      sink.addError('error, debe tener hasta 10 caracteres');
    }
  });

  final validarPassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (upass, sink) {
    if (upass.length == 4) {
      sink.add(upass);
    } else {
      sink.addError('El Código debe ser de 4 números');
    }
  });
}
