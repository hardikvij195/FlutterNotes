import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 20.0,),
                Text('Loading' , style: TextStyle(color: Colors.white , ),)
              ],
            ),
          ),

        ),
      ),

    );
  }
}


