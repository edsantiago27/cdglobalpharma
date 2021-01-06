import 'package:cdglobalpharma/src/pages/home_page.dart';
import 'package:cdglobalpharma/src/pages/login_page.dart';
import 'package:cdglobalpharma/src/pages/picking_pages.dart';
import 'package:flutter/material.dart';

import 'pages/splashscreen.dart';
import 'pages/user_detail_page.dart';
import 'providers/provider_login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App CD Global Pharma',
        initialRoute: 'splash',
        routes: {
          'splash': (BuildContext context) => SplashScreen(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'detail_user': (BuildContext context) => UserDetailPage(),
          'picking_page': (BuildContext context) => Picking(),
        },
      ),
    );
  }
}
