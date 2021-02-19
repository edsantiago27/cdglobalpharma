import 'package:flutter/material.dart';

class AppBarHom extends StatelessWidget {
  const AppBarHom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: Center(
        child: Text(''),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: Colors.redAccent[100].withOpacity(0.3)),
              child: MaterialButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Inicio',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.redAccent,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
