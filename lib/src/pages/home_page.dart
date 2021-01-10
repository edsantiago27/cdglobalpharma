import 'dart:ui';

import 'package:cdglobalpharma/src/pages/picking_pages.dart';
import 'package:cdglobalpharma/src/pages/test_page.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';
import 'user_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Menu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('Usuario:  ${bloc.usuario}')],
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
                color: Colors.blueAccent,
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
            title: Text('Usuarios'),
            leading: Icon(
              Icons.face,
              color: Colors.blueAccent,
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
              color: Colors.blueAccent,
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
              color: Colors.blueAccent,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PedidosAsignados()));
            },
          ),
          new ListTile(
            title: Text('Configuración'),
            leading: Icon(
              Icons.settings,
              color: Colors.blueAccent,
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
              color: Colors.blueAccent,
            ),
            onTap: () {
              //Navigator.of(context).push(
              // MaterialPageRoute(builder: (context) => PedidosAsignados()));
            },
          ),
        ],
      ),
    );
  }
}
