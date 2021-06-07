import 'package:flutter/material.dart';
import 'package:learnshala/LoggedInMainPages/Dean_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Hod_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Student_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Teacher_Login_MainPage.dart';
import 'package:learnshala/LoggedInPage.dart';
import 'package:learnshala/services/auth.dart';
import 'package:learnshala/shared/constants.dart';
import 'package:learnshala/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AdminPages/Admin_Main_Page.dart';


class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if( result == null ) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in with those credentials';
                        });
                      }else{

                        String type ="" ;
                        var document = await Firestore.instance.document('Users/$result');
                        document.get().then((value) {
                          setState(() {
                            type = value['Type'] ;
                            loading = false;
                          });
//                      print('Type ---> $type');
                          if(type == 'Admin'){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Admin_Main_Page()), (route) => false);
                          }else if (type == 'Student'){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Student_Login_MainPage()), (route) => false);
                          }else if (type == 'Teacher'){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Teacher_Login_MainPage()), (route) => false);
                          }else if (type == 'Dean'){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Dean_Login_MainPage()), (route) => false);
                          }else if (type == 'Hod'){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Hod_Login_MainPage()), (route) => false);
                          }
                        });
//                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoggedInAdminPage()), (route) => false);
                      }
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
