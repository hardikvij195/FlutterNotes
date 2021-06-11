import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnshala/AdminPages/Admin_Main_Page.dart';
import 'package:learnshala/LearnshalaPages/SplashScreen.dart';
import 'package:learnshala/LoggedInMainPages/Dean_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Hod_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Student_Login_MainPage.dart';
import 'package:learnshala/LoggedInMainPages/Teacher_Login_MainPage.dart';
import 'package:learnshala/loadingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CheckingLoginPage extends StatefulWidget {
  CheckingLoginPage({Key key}) : super(key: key);
  @override
  _CheckingLoginPageState createState() => _CheckingLoginPageState();
}

class _CheckingLoginPageState extends State<CheckingLoginPage> {
  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((currentUser) => {
      if (currentUser == null)
        {
          Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Splash()), (route) => false)
        }
      else
        {
          Firestore.instance.collection("Users").document(currentUser.uid).get().then((DocumentSnapshot result) {
            if(result['Type'] == 'Admin'){

              Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Admin_Main_Page(title: 'Admin' , uid: currentUser.uid,)), (route) => false);
              //Go To Admin Page
            }else if (result['Type'] == 'Student'){

              Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Student_Login_MainPage(title: 'Student' , uid: currentUser.uid,)), (route) => false);
              //Go To Student Page and diff pages ---

            }else if (result['Type'] == 'Teacher'){

              Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Teacher_Login_MainPage(title: 'Teacher' , uid: currentUser.uid,)), (route) => false);

              //Go To Student Page and diff pages ---

            }else if (result['Type'] == 'Dean'){

              Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Dean_Login_MainPage(title: 'Dean' , uid: currentUser.uid,)), (route) => false);

              //Go To Student Page and diff pages ---

            }else if (result['Type'] == 'Hod'){

              Navigator.pushAndRemoveUntil(this.context, MaterialPageRoute(builder: (context)=> Hod_Login_MainPage(title: 'Hod' , uid: currentUser.uid,)), (route) => false);

              //Go To Student Page and diff pages ---
            }}).catchError((err) => print(err))
        }}).catchError((err) => print(err));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}

