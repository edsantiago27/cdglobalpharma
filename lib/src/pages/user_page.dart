import 'dart:convert';

import 'package:cdglobalpharma/src/models/model_lgperson.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Lgperson extends StatefulWidget {
  //Lgperson({Key key}) : super(key: key);
  final lgpersonProvider = new Provider();
  @override
  _LgpersonState createState() => _LgpersonState();
}

class _LgpersonState extends State<Lgperson> {
  List<LgpersonModel> user;
  getUser() {
    Provider.listUser().then((response) {
      Iterable list = json.decode(response.body);
      List<LgpersonModel> userList = List<LgpersonModel>();
      userList = list.map((model) => LgpersonModel.fromJson(model)).toList();
      setState(() {
        user = userList;
      });
    });
  }

  final lgpersonProvider = new Provider();
  LgpersonModel lgperson = new LgpersonModel();

  @override
  Widget build(BuildContext context) {
    LgpersonModel userData = ModalRoute.of(context).settings.arguments;
    if (lgperson != null) {
      lgperson = userData;
    }
    getUser();
    //final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Operadores'),
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : _buildUserList(),
      floatingActionButton: _btnAddUser(context),
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey[100],
            elevation: 3.0,
            child: ListTile(
              trailing: Icon(Icons.more_vert),
              isThreeLine: false,
              title: Text(user[index].desPer),
              subtitle: Text(user[index].codPer),
              leading: new Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, 'detail_user',
                    arguments: lgperson);
                // _editUser(this.user[index]);
              },
            ),
          );
        });
  }

  _btnAddUser(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () => Navigator.pushNamed(context, 'detail_user'));
  }
}
