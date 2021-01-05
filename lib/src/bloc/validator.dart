import 'dart:async';

class Validators {
  final validarCodper = StreamTransformer<String, String>.fromHandlers(
      handleData: (codPer, sink) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    if (codPer.length == 4) {
      sink.add(codPer);
    } else {
      sink.addError('El Código debe ser de 4 números');
    }
  });
}
