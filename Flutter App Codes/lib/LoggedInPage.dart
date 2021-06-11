import 'package:flutter/material.dart';
import 'package:learnshala/MainPage.dart';
import 'package:learnshala/services/auth.dart';


class LoggedInAdminPage extends StatefulWidget {
  @override
  _LoggedInAdminPageState createState() => _LoggedInAdminPageState();
}

class _LoggedInAdminPageState extends State<LoggedInAdminPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Admin'),
        ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(child: Text('Logged In')),
            RaisedButton(
                child: Text('LogOut'),
                onPressed: () async {
                  AuthService().signOut().then((_) =>  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false)
                  );
            })
          ],
        ),
      ),
    );
  }
}
