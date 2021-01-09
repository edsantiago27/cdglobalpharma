import 'package:cdglobalpharma/src/bloc/pedido_bloc.dart';
import 'package:flutter/cupertino.dart';

class ProviderPedidos extends InheritedWidget {
  final pickingBloc = PickingBloc();
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  static PickingBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProviderPedidos>()
        .pickingBloc;
  }
}
