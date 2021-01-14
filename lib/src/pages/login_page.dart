import 'package:cdglobalpharma/src/bloc/login_bloc.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_createBackground(context), _loginForm(context)],
      ),
    );
  }

  Widget _createBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          color: Color.fromRGBO(255, 255, 255, 0.2)),
    );
    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(
          child: circulo,
          top: 90.0,
          left: 30.0,
        ),
        Positioned(
          child: circulo,
          top: -40.0,
          right: -30.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          right: -10.0,
        ),
        Positioned(
          child: circulo,
          bottom: 120.0,
          right: 20.0,
        ),
        Positioned(
          child: circulo,
          bottom: -50.0,
          left: -20.0,
        ),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.fingerprint,
                color: Colors.white,
                size: 80.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Operador Bodega',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 20.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 10.0)
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 30.0),
                _txtUsuario(bloc),
                SizedBox(height: 30.0),
                _txtUiPass(bloc),
                SizedBox(height: 30.0),
                _btnLogin(bloc),
              ],
            ),
          ),
          Text('¿Olvidó el código?'),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }

  Widget _txtUsuario(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.people,
                    color: Colors.amber,
                  ),
                  hintText: 'Usuario',
                  labelText: 'Usuario',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: bloc.changeUsuario,
            ),
          );
        });
  }

  Widget _txtUiPass(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outlined, color: Colors.amber),
                hintText: 'Password de Operador',
                labelText: 'Password Operador',
                counterText: snapshot.data,
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _btnLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Ingresar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          elevation: 4.0,
          color: Colors.amber,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () => _login(context, bloc) : null,
        );
      },
    );
  }

  _login(BuildContext context, LoginBloc bloc) {
    Navigator.pushReplacementNamed(context, 'home');
  }
}
