import 'package:cdglobalpharma/src/pages/home_page.dart';
import 'package:cdglobalpharma/src/pages/login_page.dart';
import 'package:cdglobalpharma/src/pages/pedidos_page.dart';
import 'package:flutter/material.dart';

import 'pages/preparacion_page.dart';
import 'pages/splashscreen.dart';
import 'pages/user_detail_page.dart';
import 'providers/provider_login.dart';

class MyApp extends StatelessWidget {
  String folio;

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App CD Global Pharma',
        theme: ThemeData(
          primaryColor: Colors.grey[200],
          accentColor: Colors.grey,
          fontFamily: 'Montserrat',
        ),
        initialRoute: 'splash',
        routes: {
          'splash': (BuildContext context) => SplashScreen(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'detail_user': (BuildContext context) => UserDetailPage(),
          'picking_page': (BuildContext context) => PreparacionesPage(),
          'preparacion': (BuildContext context) => IniciarPrep(folio),
        },
      ),
    );
  }
}
