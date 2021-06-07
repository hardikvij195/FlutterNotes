import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {

  // collection reference

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<String> GetUidAndcheckUser() async {

    FirebaseUser user =  await _auth.currentUser();
    String UsrId = user.uid ;

    String a ;
    var document = await Firestore.instance.document('Users/$UsrId');
    document.get().then((value) {
      print(value['Type']);
      a = value['Type'].toString() ;
      return value['Type'];

    });

    return a ;
  }


  Future<String> checkUser(String uid) async {

    String a ;
    var document = await Firestore.instance.document('Users/$uid');
    document.get().then((value) {
      print(value['Type']);
      a = value['Type'].toString() ;
      return value['Type'];

    });

    return a ;


  }








}
