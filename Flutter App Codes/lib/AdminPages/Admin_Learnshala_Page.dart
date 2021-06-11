import 'package:flutter/material.dart';
import 'package:learnshala/AdminPages/Learnshala/Add_Subject.dart';
import 'package:learnshala/AdminPages/Learnshala/Delete_Subject.dart';



class Admin_Learnshsla_Edit_Page extends StatefulWidget {
  @override
  _Admin_Learnshsla_Edit_PageState createState() => _Admin_Learnshsla_Edit_PageState();
}

class _Admin_Learnshsla_Edit_PageState extends State<Admin_Learnshsla_Edit_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Add Subject' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSubjects()));
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Delete Subject' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delete_Subject()));
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('View Subjects' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Add QnA' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Delete QnA' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('View QnA' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Add McQ' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('View McQ' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.indigo,
                child: Text('Delete McQ' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),

        ],
      ),
    );
  }
}
