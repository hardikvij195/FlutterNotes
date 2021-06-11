import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:learnshala/AdminPages/Admin_Main_Page.dart';
import 'package:learnshala/ButtonDesigns/progressbutton.dart';
import 'package:learnshala/services/auth.dart';
import 'package:learnshala/LoggedInMainPages/Dean_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Hod_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Student_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Teacher_Login_MainPage.dart';


class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _controller = TextEditingController();
  final AuthService _auth = AuthService();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar(String mess) {
    final snackBar = new SnackBar(
      content: new Text('$mess'),
      duration: new Duration(seconds: 2),
      backgroundColor: Colors.blue[800],
    );

    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF5036D5),
        centerTitle: true,
        title: Text('LOGIN'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.7],
            colors: [
              Color(0xFF5036D5),
              Color(0xFF5B16D0),
            ],
          )),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                    child: Center(
                        child: Image.asset('assets/sh8.png',
                            height: 90.0,
                            width: (MediaQuery.of(context).size.width))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Center(
                        child: Image.asset('assets/shardaname.png',
                            height: 90.0,
                            width: (MediaQuery.of(context).size.width))),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(accentColor: Colors.white),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          labelText: 'Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          disabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
//                            border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20.0)
//
//                            ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Theme(
                      data: Theme.of(context).copyWith(accentColor: Colors.white),
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Enter Password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          labelText: 'Password',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          disabledBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
                          focusedBorder: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0)),
//                            border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20.0)
//
//                            ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
                    child: Center(child: buildTextWithIcon()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => _openCustomDialog(),
                      child: Center(
                          child: Text(
                        'Forgot Password ?',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _openCustomDialog() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text('Enter Email'),
                content: TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child:
                        new Text('BACK', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text('SUBMIT',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField AlertDemo'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "TextField in Dialog"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  ButtonState stateOnlyText = ButtonState.idle;
  ButtonState stateTextWithIcon = ButtonState.idle;

  Widget buildCustomButton() {
    var progressTextButton = ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text(
          "Idle",
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
        ),
        ButtonState.loading: Text(
          "Loading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.fail: Text(
          "Fail",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        ButtonState.success: Text(
          "Success",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        )
      },
      stateColors: {
        ButtonState.idle: Colors.white,
        ButtonState.loading: Colors.indigo,
        ButtonState.fail: Colors.red,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: () {},
      state: stateOnlyText,
      padding: EdgeInsets.all(8.0),
    );
    return progressTextButton;
  }

  Widget buildTextWithIcon() {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
            text: 'LOGIN',
            icon: Icon(Icons.send, color: Colors.indigo),
            color: Colors.white,
          ),
          ButtonState.loading: IconedButton(
            text: "Loading",
            color: Colors.deepPurple.shade700,
          ),
          ButtonState.fail: IconedButton(
              text: "Failed",
              icon: Icon(Icons.cancel, color: Colors.white),
              color: Colors.red),
          ButtonState.success: IconedButton(
              text: "Success",
              icon: Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              color: Colors.green.shade400)
        },
        onPressed: onPressedIconWithText,
        textStyle1: TextStyle(color: Colors.indigo),
        textStyle2: TextStyle(color: Colors.white),
        textStyle3: TextStyle(color: Colors.white),
        state: stateTextWithIcon);
  }

  void onPressedIconWithText() async {
    switch (stateTextWithIcon) {
      case ButtonState.idle:

        if(_formKey.currentState.validate()){
          stateTextWithIcon = ButtonState.loading;

          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
          if( result == null ) {
            setState(() {
              stateTextWithIcon = ButtonState.fail;
              _showSnackBar('Could not sign in with those credentials');
              error = 'Could not sign in with those credentials';
            });
          }else{

            print('Uid =====> $result');
            stateTextWithIcon = ButtonState.success;
            String type ="" ;
            var document = Firestore.instance.document('Users/$result');
            document.get().then((value) {
              setState(() {
                type = value['Type'] ;
                stateTextWithIcon = ButtonState.success;
              });
              print('Type ---> $type');
              if(type == 'Admin'){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Admin_Main_Page( title: type , uid: result,)), (route) => false);
              }else if (type == 'Student'){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Student_Login_MainPage(title: type , uid: result)), (route) => false);
              }else if (type == 'Teacher'){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Teacher_Login_MainPage(title: type , uid: result)), (route) => false);
              }else if (type == 'Dean'){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Dean_Login_MainPage(title: type , uid: result)), (route) => false);
              }else if (type == 'Hod'){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Hod_Login_MainPage(title: type , uid: result)), (route) => false);
              }
            });
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoggedInAdminPage()), (route) => false);
          }
        }
//        Future.delayed(Duration(seconds: 1), () {
//          setState(() {
//
//
//
//            stateTextWithIcon = Random.secure().nextBool()
//                ? ButtonState.success
//                : ButtonState.fail;
//
//            if (stateTextWithIcon == ButtonState.success) {
//
//
//
//
//
////              Navigator.pushAndRemoveUntil(
////                  context,
////                  MaterialPageRoute(builder: (context) => LoggedInMainAdmin()),
////                  (route) => false);
//            } else {
//              //Show Toast
//
//            }
//          });
//        });

        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:

        //stateTextWithIcon = ButtonState.idle;

        break;
      case ButtonState.fail:
        stateTextWithIcon = ButtonState.idle;
        break;
    }
    setState(() {
      stateTextWithIcon = stateTextWithIcon;
    });
  }
}
