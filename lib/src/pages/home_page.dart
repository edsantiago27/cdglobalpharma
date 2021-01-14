import 'dart:ui';

import 'package:cdglobalpharma/src/pages/pedidos_page.dart';
import 'package:cdglobalpharma/src/pages/picking_pages.dart';
import 'package:cdglobalpharma/src/pages/preparaciones.dart';
import 'package:cdglobalpharma/src/pages/test_page.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Menu(),
      body: Card(
        color: Colors.grey[200],
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Preparaciones por día:'),
            )
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text(
              "Usuario: ${bloc.usuario}",
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: new AssetImage('assets/avatar.png'),
              //Colors.white,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fondo2.jpg'), fit: BoxFit.cover)),
          ),
          new ListTile(
              leading: Icon(Icons.pages, color: Colors.indigoAccent),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              }),
          new ListTile(
            title: Text('Usuarios'),
            leading: Icon(
              Icons.face,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Lgperson()));
            },
          ),
          new ListTile(
            title: Text('Pickings'),
            leading: Icon(
              Icons.fact_check,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListPickingPage()));
            },
          ),
          new ListTile(
            title: Text('Pedidos Asignados'),
            leading: Icon(
              Icons.check_box,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PreparacionesPage()));
            },
          ),
          new ListTile(
            title: Text('Configuración'),
            leading: Icon(
              Icons.settings,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              //Navigator.of(context).push(
              // MaterialPageRoute(builder: (context) => PedidosAsignados()));
            },
          ),
          new ListTile(
            title: Text('Salir'),
            leading: Icon(
              Icons.close,
              color: Colors.indigoAccent,
            ),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
