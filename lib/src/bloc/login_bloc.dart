import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'validator.dart';

class LoginBloc with Validators {
  final _codPerController = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get codPerStream =>
      _codPerController.stream.transform(validarCodper);
  // Stream<String> get formValidStream =>
  //     Rx.combineLatest(codPerStream, (c) => null);

  Function(String) get changeCodPer => _codPerController.sink.add;

  // Obtener el ultimo valor ingresado a los streams

  String get codPer => _codPerController.value;

  dispose() {
    _codPerController?.close();
  }
}
