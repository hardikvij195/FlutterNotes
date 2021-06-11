import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class AdminPage extends StatefulWidget {

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  final db = Firestore.instance;
  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();
  TextEditingController subnameController = TextEditingController();
  TextEditingController subdescController = TextEditingController();
  String subname = "";
  String subdesc = "";
  var now = new DateTime.now();
  var day = new DateFormat('yyyyMMdd');
  var id = new DateFormat('yyyyMMddHHmmss');
  var noteDate = DateFormat("dd-MM-yy");

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    titleController.text = currentNote.title;
//    contentController.text = currentNote.content;
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: subnameController,
                  onChanged: (value) {
                    subname = value;
                    print('subject name ---- $subname');

                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    labelText: 'Subject Name',
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

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: subdescController,
                  onChanged: (value) {
                    subdesc = value;
                    print('subject desc ---- $subdesc');
                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    labelText: 'Subject Description',
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
              RaisedButton(
                onPressed:createData,
                child: const Text('OK', style: TextStyle(fontSize: 20)),
              ),
            ],

          ),
        ),
      ),





    );
  }


  void createData() async {

    final String Id = id.format(now);

    if(Id != null){

      db.collection("Subjects").document(Id).setData(
          {
            "SubName" : subname,
            "SubDesc" : subdesc,
          }).then((_){
        print("success!");
        print(Id);
      });

    }

  }








}

