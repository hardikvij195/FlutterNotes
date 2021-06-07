import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:learnshala/AddMcQ.dart';
import 'package:learnshala/AddQnA.dart';
import 'package:learnshala/AddSubjects.dart';
import 'package:learnshala/AdminPage.dart';
import 'package:learnshala/EmailPassLogin.dart';
import 'package:learnshala/ReadMcQ.dart';
import 'package:learnshala/ReadQnA.dart';
import 'package:learnshala/ViewSubjects.dart';
import 'package:learnshala/fire.dart';
import 'package:learnshala/imagePicker.dart';
import 'package:learnshala/services/database.dart';
import 'dart:io';
import 'package:path/path.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Learnshala'),
        ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              RaisedButton(
                  child: Text('Add Subject'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddSubjects()));
                  }),
              RaisedButton(
                  child: Text('View Subjects'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSubjects()));
                  }),
              RaisedButton(
                  child: Text('Add McQ'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddMcQPage()));
                  }),
              RaisedButton(
                  child: Text('View McQ'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadMcQ()));
                  }),
              RaisedButton(
                  child: Text('Add QnA'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddQnA()));
                  }),
              RaisedButton(
                  child: Text('View QnA'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadQnA()));
                  }),
              RaisedButton(
                  child: Text('EmailPass Login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EmailLogin()));
                  }),

              RaisedButton(
                  child: Text('Check Data'),
                  onPressed: () async {
                    String type ="" ;
                    var document = await Firestore.instance.document('Users/m56jth3Gv4cgW9NOyiMQOA6yrXu1');
                    document.get().then((value) {
                      setState(() {
                        type = value['Type'] ;
                      });
//                      print('Type ---> $type');
                      if(type == 'Admin'){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false);

                      }else if (type == 'Student'){

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false);


                      }else if (type == 'Teacher'){


                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false);


                      }else if (type == 'Dean'){


                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false);


                      }else if (type == 'Hod'){

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainPage()), (route) => false);

                      }
                    });
                  }),
            ],
          ),
        ));
  }
}
