import 'dart:convert';
import 'package:cdglobalpharma/src/models/model_lgperson.dart';
import 'package:cdglobalpharma/src/providers/provider_login.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de Usuarios'),
        actions: [
          IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: (){
            
          })
        ],
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
              title: Text('Nombre:  ' + user[index].desPer),
              subtitle: Text('Prep: ' +
                  user[index].prep +
                  '  ' +
                  'Rev: ' +
                  user[index].rev +
                  ' ' +
                  'Transp: ' +
                  user[index].trans),
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
        child: Icon(
          Icons.add,
          color: Colors.amber,
        ),
        backgroundColor: Colors.indigoAccent,
        onPressed: () => Navigator.pushNamed(context, 'detail_user'));
  }
}
