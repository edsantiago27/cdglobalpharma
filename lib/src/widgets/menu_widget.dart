import 'package:cdglobalpharma/src/pages/asignaciones_page.dart';
import 'package:cdglobalpharma/src/pages/home_page.dart';
import 'package:cdglobalpharma/src/pages/pedidos_page.dart';
import 'package:cdglobalpharma/src/pages/picking_pages.dart';
import 'package:cdglobalpharma/src/pages/test_page.dart';
import 'package:cdglobalpharma/src/pages/user_page.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Drawer(
      elevation: 16.0,
      child: ListView(
        children: <Widget>[
          new Container(
            child: DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/fondo2.jpg'),
              ),
            ),
            color: Colors.amber,
          ),
          Container(
            color: Colors.amberAccent,
            child: Column(
              children: [
                new ListTile(
                    leading: Icon(Icons.pages, color: Colors.black),
                    title: Text(
                      'Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName);
                    }),
                new ListTile(
                  title: Text(
                    'Usuarios',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.face,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Lgperson()));
                  },
                ),
                new ListTile(
                  title: Text(
                    'Pickings',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.fact_check,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListPickingPage()));
                  },
                ),
                new ListTile(
                  title: Text(
                    'Pedidos Asignados',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.check_box,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PreparacionesPage()));
                  },
                ),
                new ListTile(
                  title: Text(
                    'Asignar Pedidos',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.add_moderator,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AsignarPedidoPage()),
                      //builder: (context) => PedidosAsignados()),
                    );
                  },
                ),
                new ListTile(
                  title: Text(
                    'Configuración',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onTap: () {
                    //Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => PedidosAsignados()));
                  },
                ),
                new ListTile(
                  title: Text(
                    'Salir',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  leading: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onTap: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
