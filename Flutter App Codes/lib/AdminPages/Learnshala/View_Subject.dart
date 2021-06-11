import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';



class SubListClass{

  String id , name , desc , image ;
  SubListClass( this.id ,this.name , this.desc , this.image);

}


class View_Subjects extends StatefulWidget {
  @override
  _View_SubjectsState createState() => _View_SubjectsState();
}

class _View_SubjectsState extends State<View_Subjects> {

  final db = Firestore.instance;
  SubListClass selectedSubject ;

  onChangeDropdownItem(SubListClass selectedCompany) {

    setState(() {
      selectedSubject = selectedCompany;
      //print(selectedSubject.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Subjects'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(height: 40.0),
            Center(
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("Subjects").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null){
                      return const Center(
                        child: Text(
                          "Not Available",
                          style: TextStyle(fontSize: 30.0, color: Colors.grey),
                        ),
                      );
                    }
                    else if (snapshot.data.documents.length == 0)
                      return const Center(
                        child: Text(
                          "Not Available",
                          style: TextStyle(fontSize: 30.0, color: Colors.grey),
                        ),
                      );
                    else if(snapshot.hasError)
                      const Text("Error");
                    else if (!snapshot.hasData)
                      const Text("Loading.....");
                    else if(snapshot.hasData){
                      List<DropdownMenuItem<SubListClass>> SubList = List();
                      for (int i = 0; i < snapshot.data.documents.length; i++) {
                        DocumentSnapshot snap = snapshot.data.documents[i];
                        SubListClass sb = new SubListClass(snap.documentID ,
                            snap.data['Name'], snap.data['Desc'],
                            snap.data['Image']);
                        SubList.add(
                          DropdownMenuItem(
                            child: Text(
                              sb.name,
                              style: TextStyle(color: Colors.indigo),
                            ), value: sb,
                          ),
                        );
                      }
                      selectedSubject = SubList[0].value ;
                      return SubList.length ==0 ? Text('No Item') : DropdownButton(
                        value: selectedSubject,
                        items: SubList,
                        onChanged: onChangeDropdownItem,
                        hint: Text('Select'),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedSubject == null ?  'Name' : selectedSubject.name),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedSubject == null ?  'Desc' : selectedSubject.desc),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: selectedSubject == null ?  null : Image.network(selectedSubject.image , height: 200 ,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
