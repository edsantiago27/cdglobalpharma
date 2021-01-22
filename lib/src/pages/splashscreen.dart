import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                0.1,
                0.6,
                0.9
              ],
                      colors: [
                Colors.amber[50],
                Colors.amber[500],
                Colors.amber[800]
              ]))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Image.asset(
                'assets/logos_transp.png',
                height: 150.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Spacer(),
              SpinKitFadingCube(
                color: Colors.grey[700],
              ),
              Spacer(),
              Text(
                'Bienvenidos a la app de CD',
                style: TextStyle(color: Colors.grey[700]),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
