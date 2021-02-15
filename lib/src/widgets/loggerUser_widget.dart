import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

class LoggerUser extends StatefulWidget {
  LoggerUser({Key key}) : super(key: key);

  @override
  _LoggerUserState createState() => _LoggerUserState();
}

class _LoggerUserState extends State<LoggerUser> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Row(
        children: [
          Container(
            width: 75.0,
            height: 75.0,
            decoration: BoxDecoration(),
            child: Image(
              image: AssetImage('assets/avatar.png'),
            ),
          ),
          SizedBox(
            width: 24.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${bloc.usuario}',
                //'${info.usuario}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Operador',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
