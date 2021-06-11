import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';


class ReadQnA extends StatefulWidget {
  @override
  _ReadQnAState createState() => _ReadQnAState();
}

class _ReadQnAState extends State<ReadQnA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection('QnA').snapshots(),
        builder: (BuildContext  context,AsyncSnapshot snapshot){
            if (snapshot.hasError)
              return Text('Error');
            else if (!snapshot.hasData){
              return Text('No Data');
            }
            else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context , index){
                    DocumentSnapshot qna = snapshot.data.documents[index];
                    print('${qna['Ques']}');
                    return CardQnA(context , '${qna['Ques']}' , '${qna['Ans']}' );
//                    return Text('Has Data');
//                    return CardWid(context , '${qna['Ques']}' , '${qna['Ans']}' );
                  });


            }
            return Center(child: CircularProgressIndicator());

          },

      ),
    );
  }


  //                  return CardWid(context , '${qna['Ques']}' , '${qna['Ans']}' );


  Widget CardQnA(BuildContext context , String ques , String ans) {
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
                    collapsed: Text(
                      ans,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              ans,
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


