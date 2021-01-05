import 'package:cdglobalpharma/src/models/model_lgperson.dart';
import 'package:cdglobalpharma/src/pages/user_page.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  UserDetailPage({Key key}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  var codper = TextEditingController();
  var desper = TextEditingController();
  LgpersonModel lgperson = new LgpersonModel();
  final lgpersonProvider = new Provider();
  var prep = TextEditingController();
  var rev = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var trans = TextEditingController();
  var usuario = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _guardando = false;

  Widget _builForm() {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: lgperson.codPer,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Código Operador'),
                onSaved: (value) => lgperson.codPer = value,
                validator: (value) {
                  if (value.length < 3) {
                    return 'El codigo debe ser igual a 4 numeros';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: lgperson.desPer,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    labelText: 'Escriba el Nombre del operador'),
                onSaved: (value) => lgperson.desPer = value,
                validator: (value) {
                  if (value.length < 3) {
                    return 'se permiten todos los caracteres';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: lgperson.prep,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Preparación?'),
                onSaved: (value) => lgperson.prep = value,
                validator: (value) {
                  if (value.length < 3) {
                    return 'escriba S o N';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: lgperson.rev,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Revisión?'),
                onSaved: (value) => lgperson.rev = value,
                validator: (value) {
                  if (value.length < 3) {
                    return 'escriba S o N';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: lgperson.usuario,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(labelText: 'Escriba el usuario'),
                onSaved: (value) => lgperson.usuario = value,
                validator: (value) {
                  if (value.length < 3) {
                    return 'debe escribir todo en mayuscula';
                  } else {
                    return null;
                  }
                },
              ),
              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.deepPurple,
                textColor: Colors.white,
                label: Text('Guardar'),
                icon: Icon(Icons.save),
                onPressed: (_guardando) ? null : _submit,
              ),
            ],
          )),
    ));
  }

  void _submit() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();

    setState(() {
      _guardando = true;
    });
    if (lgperson.codPer != null) {
      Provider.editUser(lgperson);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final LgpersonModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      lgperson = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Detalle de Usuario'),
      ),
      body: _builForm(),
    );
  }
}
