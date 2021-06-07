import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddMcQPage extends StatefulWidget {
  @override
  _AddMcQPageState createState() => _AddMcQPageState();
}

class _AddMcQPageState extends State<AddMcQPage> {

  final db = Firestore.instance;
  TextEditingController QuesController = TextEditingController();
  TextEditingController AnsController = TextEditingController();
  TextEditingController Op1Controller = TextEditingController();
  TextEditingController Op2Controller = TextEditingController();
  TextEditingController Op3Controller = TextEditingController();

  String Ques = "";
  String Ans = "";
  String Op1 = "";
  String Op2 = "";
  String Op3 = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add McQ'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: QuesController,
              onChanged: (value) {
                Ques = value;
                print('Question ---- $Ques');

              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: AnsController,
              onChanged: (value) {
                Ans = value;
                print('Ans ---- $Ans');
              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: Op1Controller,
              onChanged: (value) {
                Op1 = value;
                print('Op1 ---- $Op1');

              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: Op2Controller,
              onChanged: (value) {
                Op2 = value;
                print('Op2 ---- $Op2');
              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: Op3Controller,
              onChanged: (value) {
                Op3 = value;
                print('Op3 ---- $Op3');
              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          RaisedButton(
              child: Text('Add'),
              onPressed: createData)




        ],

      ),
    );
  }


  void createData() async {

    var now = new DateTime.now();
    var id = new DateFormat('yyyyMMddHHmmss');
    final String Id = id.format(now);

    if(Id != null && Ques != "" && Ans != "" && Op1 != "" && Op2 != "" && Op3 != "" ){

      db.collection("McQ").document(Id).setData(
          {
            "Ques" : Ques,
            "Ans" : Ans,
            "Op1" : Op1,
            "Op2" : Op2,
            "Op3" : Op3,

          }).then((_){
        print("success!");
        print(Id);
      });

      setState(() {
        Ques="" ;
        Ans = "" ;
        Op1 = "" ;
        Op2 = "" ;
        Op3 = "" ;

        QuesController.clear();
        AnsController.clear();
        Op1Controller.clear();
        Op2Controller.clear();
        Op3Controller.clear();

      });

    }else{

      print("Cannnot be empty");

    }

  }



}

