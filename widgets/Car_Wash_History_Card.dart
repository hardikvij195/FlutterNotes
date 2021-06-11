import 'package:cleanwheel/Classes/Classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Car_Wash_History_Card extends StatelessWidget {

  WasherWashsheetApproval cr;
  Car_Wash_History_Card(this.cr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Card(
        color: Colors.blue,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
      ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(cr.Date , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(cr.Time , style: TextStyle(color: Colors.white  , fontWeight: FontWeight.bold),),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(cr.Name , style: TextStyle(color: Colors.white  , fontWeight: FontWeight.bold),),
              ),


              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(cr.RcNo , style: TextStyle(color: Colors.white  , fontWeight: FontWeight.bold),),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
