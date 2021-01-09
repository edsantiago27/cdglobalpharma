import 'dart:ui';

import 'package:cdglobalpharma/src/pages/test_page.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

import 'pedidos_page.dart';
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
            // accountEmail: Text(
            //   "Usuario: ${bloc.usuario}",
            //   style: TextStyle(
            //     color: Colors.blueAccent,
            //   ),
            // ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fondo1.png'), fit: BoxFit.cover)),
          ),
          new ListTile(
            title: Text('Usuarios'),
            leading: Icon(Icons.face),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Lgperson()));
            },
          ),
          new ListTile(
            title: Text('Pedidos Asignados'),
            leading: Icon(Icons.check_box),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PedidosAsignados()));
            },
          ),
          new ListTile(
            title: Text('Pedidos Asignados'),
            leading: Icon(Icons.check_box),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TestPage()));
            },
          ),
        ],
      ),
    );
  }
}
