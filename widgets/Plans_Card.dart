import 'package:cleanwheel/Classes/Classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Plan_Card extends StatelessWidget {

  String Level , Price , Info ;
  Car cr ;
  Us usr ;

  Plan_Card(this.Level , this.Price , this.Info ,  this.usr , this.cr);
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              Level+"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
              child: Text(
                Price,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                Info,
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,


                ),
              ),
            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }


  showAlertDialog(BuildContext context, Car car , Us use , String PlanLevel ) {
    // set up the buttons
    Widget submitButton = FlatButton(
      child: Text("YES"),
      onPressed: () {

        //Show Payment -->





        db.collection("UserCars").doc(use.Id).collection("CarIds").doc(car.CarId).set({
          "N": car.CarName,
          "B": car.BrandName,
          "R": car.RcNumber,
          "T": car.Type,
          "P": PlanLevel,
          "PId": "True"
        });
        
        Navigator.pop(context);

        // Navigator.pop(context);
        // Navigator.pop(context);

      },
    );
    Widget cancelButton = FlatButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("CONFIRM PLAN"),
      actions: [cancelButton, submitButton],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}





class Plan_Card2 extends StatelessWidget {

  String Level , Price , Info ;
  Car cr ;
  Us usr ;

  Plan_Card2(this.Level , this.Price , this.Info ,  this.usr , this.cr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              Level+"",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
              child: Text(
                Price,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                Info,
                textAlign: TextAlign.center,
                style: TextStyle(

                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,


                ),
              ),
            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }

}
