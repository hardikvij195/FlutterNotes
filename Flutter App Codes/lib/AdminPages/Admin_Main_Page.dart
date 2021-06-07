import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:learnshala/AdminPages/Admin_Learnshala_Page.dart';
import 'package:learnshala/AdminPages/Admin_ShardaApp_Page.dart';
import 'package:learnshala/MainPage.dart';
import 'package:learnshala/services/auth.dart';
import 'package:flutter_icons/flutter_icons.dart';


class Admin_Main_Page extends StatefulWidget {

  final String title;
  final String uid;
  Admin_Main_Page({Key key, this.title, this.uid}) : super(key: key);



  @override
  _Admin_Main_PageState createState() => _Admin_Main_PageState();
}

class _Admin_Main_PageState extends State<Admin_Main_Page> {

  int current_Index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current_Index = 0;
  }


  changePage(int index) {
    setState(() {
      current_Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
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
              child: Container(
                  child: Column(children: <Widget>[
                    Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10.0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                          Image.asset('assets/logo.png', width: 70, height: 70),
                        ) //
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                      child: Text('LEARNSHALA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          )),
                    )
                  ])),
            ),

            CustomListTileIcon(SimpleLineIcons.info, 'About App', () {

            }),
          ])),

      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Color(0xff262AAA),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        currentIndex: current_Index,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        onTap: changePage,
        items: [
          BubbleBottomBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: Text('Learnshala Edit'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            title: Text('Sharda Edit App'),
          ),
        ]),
      body: (current_Index == 0)
          ? Admin_Learnshsla_Edit_Page()
          : (current_Index == 1)
          ? Admin_LearnshalaPage()
          : (current_Index == 2),

    );
  }
}




class CustomListTile extends StatelessWidget {
  CustomListTile(this.icon, this.text, this.onTap);

  final String icon;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: onTap,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage(icon),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTileIcon extends StatelessWidget {
  CustomListTileIcon(this.icon, this.text, this.onTap);

  final IconData icon;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: InkWell(
        splashColor: Colors.blueAccent,
        onTap: onTap,
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  SizedBox(width: 10.0),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}

