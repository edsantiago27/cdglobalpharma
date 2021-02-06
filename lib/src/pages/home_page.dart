import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:cdglobalpharma/src/widgets/graph_widget.dart';
import 'package:cdglobalpharma/src/widgets/infoUser_widget.dart';
import 'package:cdglobalpharma/src/widgets/loggerUser_widget.dart';
import 'package:cdglobalpharma/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'dart:ui';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    PedidosAsignadosModel pedidosAsignadosModel;
    final bloc = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(''),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: Colors.redAccent[100].withOpacity(0.3)),
                child: MaterialButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Inicio',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.redAccent,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
      drawer: Menu(),
      body: Column(
        children: <Widget>[
          LoggerUser(),
          InfoUserHome(),
          GraphicsLinesHome(),
        ],
      ),
    );
  }
}
