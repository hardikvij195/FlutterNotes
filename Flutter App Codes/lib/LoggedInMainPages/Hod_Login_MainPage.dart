import 'package:flutter/material.dart';
import 'package:learnshala/MainPage.dart';
import 'package:learnshala/services/auth.dart';


class Hod_Login_MainPage extends StatefulWidget {


  final String title;
  final String uid;
  Hod_Login_MainPage({Key key, this.title, this.uid}) : super(key: key);

  @override
  _Hod_Login_MainPageState createState() => _Hod_Login_MainPageState();
}

class _Hod_Login_MainPageState extends State<Hod_Login_MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hod'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(child: Text('Logged In Hod')),
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
