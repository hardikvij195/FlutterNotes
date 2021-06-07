import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';

class ViewSubjects extends StatefulWidget {
  @override
  _ViewSubjectsState createState() => _ViewSubjectsState();
}

class _ViewSubjectsState extends State<ViewSubjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
          child: Column(children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                    'What Would you like to\nLEARN TODAY ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Text('Search Button'),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Text(
                  'Courses',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Subjects').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError)
                        return Text('Error');
                    else if (!snapshot.hasData){
                        return Text('No Data');
                    } else if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot sub = snapshot.data.documents[index];
                          return makeItem2(context , '${sub['Image']}' , '${sub['SubName']}' ,'${sub['SubDesc']}' ,sub.documentID );
                      },

                  );}
                    return Center(child: CircularProgressIndicator());
                  }

                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget makeItem2(BuildContext context , String image , String subname , String subdesc , String id ) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: GestureDetector(
          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => TopicInfo(
//                      name: title,
//                      image: image,
//                      info: infoText,
//                    )));
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.2),
                ])),
            child: Center(
              child: Column(children: <Widget>[
                Material(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.transparent,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 8.0),
                        child: Container(
                            height: 50,
                            child: Image.network(
                              image,
                            ))) //
                    ),
                Text(
                  subname,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
