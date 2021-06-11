import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';


class ReadMcQ extends StatefulWidget {
  @override
  _ReadMcQState createState() => _ReadMcQState();
}

class _ReadMcQState extends State<ReadMcQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Hellooooo'),
          ),
          Flexible(
            child: StreamBuilder(
              stream: Firestore.instance.collection('McQ').snapshots(),
              builder: (BuildContext  context,AsyncSnapshot snapshot){
                if (snapshot.hasError)
                  return Text('Error');
                else if (!snapshot.hasData){
                  return Text('No Data');
                }
                else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context , index){
                        DocumentSnapshot mcq = snapshot.data.documents[index];
//                  print('${qna['Ques']}');
                        return McQ(context , '${mcq['Ques']}' , '${mcq['Ans']}' ,'${mcq['Op1']}' , '${mcq['Op2']}' , '${mcq['Op3']}' );
//                    return Text('Has Data');

//                    return CardWid(context , '${qna['Ques']}' , '${qna['Ans']}' );
                      });


                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget McQ(BuildContext context , String ques , String ans , String op1 , String op2 , String op3) {

    Random rnd;
    int min = 1;
    int max = 16;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    print("$r is in the range of $min and $max");

    String o1 , o2 , o3 , o4 , An;

    if(r == 1 ){

      An = "(a) $ans";
      o1 = "(a) $ans";
      o2 = "(b) $op1" ;
      o3 = "(c) $op2" ;
      o4 = "(d) $op3" ;

    }else if(r == 2){

      An = "(a) $ans";
      o1 = "(a) $ans";
      o2 = "(b) $op2" ;
      o3 = "(c) $op3" ;
      o4 = "(d) $op1" ;

    }else if(r == 3){

      An = "(a) $ans";
      o1 = "(a) $ans";
      o2 = "(b) $op3" ;
      o3 = "(c) $op1" ;
      o4 = "(d) $op2" ;

    }else if(r == 4){

      An = "(a) $ans";
      o1 = "(a) $ans";
      o2 = "(b) $op2" ;
      o3 = "(c) $op1" ;
      o4 = "(d) $op3" ;

    }else if(r == 5){

      An = "(b) $ans";
      o1 = "(a) $op1" ;
      o2 = '(b) $ans' ;
      o3 = "(c) $op2" ;
      o4 = "(d) $op3" ;

    }else if(r == 6){
      An = "(b) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $ans' ;
      o3 = "(c) $op3" ;
      o4 = "(d) $op1" ;


    }else if(r == 7){

      An = "(b) $ans";

      o1 = "(a) $op3" ;
      o2 = '(b) $ans' ;
      o3 = "(c) $op1" ;
      o4 = "(d) $op2" ;


    }else if(r == 8){

      An = "(b) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $ans' ;
      o3 = "(c) $op1" ;
      o4 = "(d) $op3" ;


    }else if(r == 9){

      An = "(c) $ans";

      o1 = "(a) $op1" ;
      o2 = '(b) $op2' ;
      o3 = '(c) $ans' ;
      o4 = "(d) $op3" ;

    }else if(r == 10){

      An = "(c) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $op3' ;
      o3 = '(c) $ans' ;
      o4 = "(d) $op1" ;


    }else if(r == 11){

      An = "(c) $ans";

      o1 = "(a) $op3" ;
      o2 = '(b) $op1' ;
      o3 = '(c) $ans' ;
      o4 = "(d) $op2" ;


    }else if(r == 12){

      An = "(c) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $op1' ;
      o3 = '(c) $ans' ;
      o4 = "(d) $op3" ;

    }else if(r == 13){

      An = "(d) $ans";

      o1 = "(a) $op1" ;
      o2 = '(b) $op2' ;
      o3 = '(c) $op3' ;
      o4 = '(d) $ans' ;

    }else if(r == 14){

      An = "(d) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $op3' ;
      o3 = '(c) $op1' ;
      o4 = '(d) $ans' ;

    }else if(r == 15){

      An = "(d) $ans";

      o1 = "(a) $op3" ;
      o2 = '(b) $op1' ;
      o3 = '(c) $op2' ;
      o4 = '(d) $ans' ;

    }else if(r == 16){
      An = "(d) $ans";

      o1 = "(a) $op2" ;
      o2 = '(b) $op1' ;
      o3 = '(c) $op3' ;
      o4 = '(d) $ans' ;

    }






    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          ques,
                          style: Theme.of(context).textTheme.body2,
                        )),
                    collapsed: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o1,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o2,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o3,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o4,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),

                      ],
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o1,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o2,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o3,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              o4,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Ans : $An',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          theme: const ExpandableThemeData(crossFadePoint: 0),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }





}

