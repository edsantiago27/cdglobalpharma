import 'package:cdglobalpharma/src/models/model_ped_asigna.dart';
import 'package:flutter/material.dart';
import 'package:cdglobalpharma/src/pages/pedidos_page.dart';
import 'package:cdglobalpharma/src/pages/picking_pages.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'user_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    PedidosAsignadosModel pedidosAsignadosModel;
    final bloc = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Menu(),
        body: _getdefaultPieChart());
  }

  SfCircularChart _getdefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: 'Card'),
      //legend: Legend(isVisible: ),
      series: _getdefaultPieSeries(),
    );
  }

  List<PieSeries<PedidosAsignadosModel, String>> _getdefaultPieSeries() {
    final List<PedidosAsignadosModel> pieData = <PedidosAsignadosModel>[
      PedidosAsignadosModel(folio: 'folio', desPer: 'carlos', codPer: '0136'),
      PedidosAsignadosModel(folio: 'folio1', desPer: 'juan', codPer: '0026'),
      PedidosAsignadosModel(folio: 'folio2', desPer: 'luis', codPer: '1069'),
      PedidosAsignadosModel(folio: 'folio3', desPer: 'maria', codPer: '1598'),
    ];
    return <PieSeries<PedidosAsignadosModel, String>>[
      PieSeries<PedidosAsignadosModel, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: pieData,
          xValueMapper: (PedidosAsignadosModel data, _) => data.folio,
          yValueMapper: (PedidosAsignadosModel data, _) => data.lineas,
          dataLabelMapper: (PedidosAsignadosModel data, _) => data.desPer,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: DataLabelSettings(isVisible: true)),
    ];
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
                color: Colors.grey[100],
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
              leading: Icon(Icons.pages, color: Colors.grey[500]),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              }),
          new ListTile(
            title: Text('Usuarios'),
            leading: Icon(
              Icons.face,
              color: Colors.grey[500],
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
              color: Colors.grey[500],
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
              color: Colors.grey[500],
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
              color: Colors.grey[500],
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
              color: Colors.grey[500],
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
