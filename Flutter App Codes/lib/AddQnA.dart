import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



class AddQnA extends StatefulWidget {
  @override
  _AddQnAState createState() => _AddQnAState();
}

class _AddQnAState extends State<AddQnA> {

  final db = Firestore.instance;
  TextEditingController QuesController = TextEditingController();
  TextEditingController AnsController = TextEditingController();
  String Ques = "";
  String Ans = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add QnA'),
      ),
      body: Column(
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

    if(Id != null && Ques != "" && Ans != ""){

      db.collection("QnA").document(Id).setData(
          {
            "Ques" : Ques,
            "Ans" : Ans,
          }).then((_){
        print("success!");
        print(Id);
      });

      setState(() {
        Ques="" ;
        Ans = "" ;
        QuesController.clear();
        AnsController.clear();

      });

    }else{

      print("Cannnot be empty");


    }

  }



}
