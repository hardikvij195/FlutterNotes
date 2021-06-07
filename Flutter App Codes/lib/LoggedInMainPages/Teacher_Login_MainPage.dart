import 'package:flutter/material.dart';
import 'package:learnshala/MainPage.dart';
import 'package:learnshala/services/auth.dart';



class Teacher_Login_MainPage extends StatefulWidget {

  final String title;
  final String uid;
  Teacher_Login_MainPage({Key key, this.title, this.uid}) : super(key: key);

  @override
  _Teacher_Login_MainPageState createState() => _Teacher_Login_MainPageState();
}

class _Teacher_Login_MainPageState extends State<Teacher_Login_MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Center(child: Text('Logged In Teacher')),
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
