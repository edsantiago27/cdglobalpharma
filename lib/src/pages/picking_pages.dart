import 'package:flutter/material.dart';

class Picking extends StatefulWidget {
  Picking({Key key}) : super(key: key);

  @override
  _PickingState createState() => _PickingState();
}

class _PickingState extends State<Picking> {
  var folio = TextEditingController();
  var items = TextEditingController();
  var ubicacion = TextEditingController();
  var lotes = TextEditingController();
  var codigo = TextEditingController();
  var total = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Picking'),
      ),
      body: _buildformPicking(),
    );
  }

  Widget _buildformPicking() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(key: _formKey, child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            
          ],
        )),
      ),
    );
  }
}
