import 'package:flutter/material.dart';


class Admin_LearnshalaPage extends StatefulWidget {
  @override
  _Admin_LearnshalaPageState createState() => _Admin_LearnshalaPageState();
}

class _Admin_LearnshalaPageState extends State<Admin_LearnshalaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Add Student' , style: TextStyle( color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Delete Student' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('View Student' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Add Teacher' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Delete Teacher' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('View Teacher' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Add Hod' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('View Hod' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 2.0),
            child: RaisedButton(
                color: Colors.indigo,
                child: Text('Delete Hod' , style: TextStyle( backgroundColor: Colors.indigo , color: Colors.white),),
                onPressed: () {

                }),
          ),

        ],
      ),




    );
  }
}
