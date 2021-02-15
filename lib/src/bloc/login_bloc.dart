
import 'package:rxdart/rxdart.dart';

import 'validator.dart';

class LoginBloc with Validators {
  final _usuarioController = BehaviorSubject<String>();
  final _upassController = BehaviorSubject<String>();
  //final _codigoController = BehaviorSubject<String>();

  // Recuperar datos del Stream
  Stream<String> get usuarioStream =>
      _usuarioController.stream.transform(validarUsuario);
  Stream<String> get passwordStream =>
      _upassController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(usuarioStream, passwordStream, (a, b) => true);

  Function(String) get changeUsuario => _usuarioController.sink.add;
  Function(String) get changePassword => _upassController.sink.add;

  // Obtener el ultimo valor ingresado a los streams
  String get usuario => _usuarioController.value;
  String get password => _upassController.value;
  //String get codigo => _codigoController.value;

  dispose() {
    _usuarioController?.close();
    _upassController?.close();
  }
}
