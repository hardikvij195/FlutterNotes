import 'package:cleanwheel/Classes/Classes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';

final db = FirebaseFirestore.instance;

class Car_Wash_Approval_Card extends StatelessWidget {
  WasherWashsheetApproval cr;

  Car_Wash_Approval_Card(this.cr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        cr.Name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        cr.RcNo,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        cr.Time,
                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        cr.Date,
                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    //splashColor: Colors.red, // inkwell color
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(LineIcons.times, color: Colors.red)),
                    onTap: () {
                      //Rejection Confirm
                      showRejectionAlertDialog(context, cr);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    //splashColor: Colors.red, // inkwell color
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          LineIcons.check,
                          color: Colors.blue,
                        )),
                    onTap: () {
                      //Approval Confirm
                      showApprovalAlertDialog(context, cr);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Car_Wash_Rejected_Card extends StatelessWidget {
  WasherWashsheetApproval cr;

  Car_Wash_Rejected_Card(this.cr);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(cr.Name , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(cr.RcNo , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(cr.Time , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(cr.Date , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // ClipOval(
              //   child: Material(
              //     color: Colors.red, // button color
              //     child: InkWell(
              //       //splashColor: Colors.red, // inkwell color
              //       child: SizedBox(width: 56, height: 56, child: Icon(LineIcons.times , color: Colors.white)),
              //       onTap: () {
              //
              //
              //         //Rejection Confirm
              //
              //
              //
              //
              //
              //       },
              //     ),
              //   ),
              // ),
              // SizedBox(width: 10,),
              ClipOval(
                child: Material(
                  color: Colors.white, // button color
                  child: InkWell(
                    //splashColor: Colors.red, // inkwell color
                    child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          LineIcons.check,
                          color: Colors.blue,
                        )),
                    onTap: () {
                      //Approval Confirm
                      showApprovalAfterRejectedAlertDialog(context, cr);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showApprovalAlertDialog(BuildContext context, WasherWashsheetApproval car) {
  // set up the buttons
  Widget submitButton = FlatButton(
    child: Text("Submit"),
    onPressed: () {
      db
          .collection("UserCars")
          .doc(car.UId)
          .collection("AllHistory")
          .doc(car.WId)
          .set({
        "D": car.Day,
        "T": car.Time,
        "Dt": car.Date,
        "Rc": car.RcNo,
        "C": car.Name,
        "WaId": car.WaId,
        "WId": car.WId,
        "AsId": car.AsId,
        "UId": car.UId,
        "CId": car.CId,
      }).then((value) {
        db
            .collection("UserCars")
            .doc(car.UId)
            .collection("CarIds")
            .doc(car.CId)
            .collection("History")
            .doc(car.WId)
            .set({
          "D": car.Day,
          "T": car.Time,
          "Dt": car.Date,
          "Rc": car.RcNo,
          "C": car.Name,
          "WaId": car.WaId,
          "WId": car.WId,
          "AsId": car.AsId,
          "UId": car.UId,
        });

        db
            .collection("Washers")
            .doc(car.WaId)
            .collection("AllHistory")
            .doc(car.WId)
            .set({
          "D": car.Day,
          "T": car.Time,
          "Dt": car.Date,
          "Rc": car.RcNo,
          "C": car.Name,
          "WaId": car.WaId,
          "WId": car.WId,
          "AsId": car.AsId,
          "UId": car.UId,
          "CId": car.CId,
        }).then((value) {
          db
              .collection("Washers")
              .doc(car.UId)
              .collection("CarAssigned")
              .doc(car.AsId)
              .collection("History")
              .doc(car.WId)
              .set({
            "D": car.Day,
            "T": car.Time,
            "Dt": car.Date,
            "Rc": car.RcNo,
            "C": car.Name,
            "WaId": car.WaId,
            "WId": car.WId,
            "AsId": car.AsId,
            "UId": car.UId,
          });

          db
              .collection("CarAssigned")
              .doc(car.AsId)
              .collection("AllHistory")
              .doc(car.WId)
              .set({
            "D": car.Day,
            "T": car.Time,
            "Dt": car.Date,
            "Rc": car.RcNo,
            "C": car.Name,
            "WaId": car.WaId,
            "WId": car.WId,
            "AsId": car.AsId,
            "UId": car.UId,
            "CId": car.CId,
          }).then((value) {
            db
                .collection("CarAssigned")
                .doc(car.AsId)
                .collection("Approval")
                .doc(car.WId)
                .delete();
            db
                .collection("Washers")
                .doc(car.WaId)
                .collection("Approval")
                .doc(car.WId)
                .delete();
            db
                .collection("UserCars")
                .doc(car.UId)
                .collection("Approval")
                .doc(car.WId)
                .delete();

            Fluttertoast.showToast(
                msg: 'Washsheet Approved',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.white,
                textColor: Colors.blue);
          });
        });
      });

      Navigator.pop(context);
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Approval" , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold),),
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

showApprovalAfterRejectedAlertDialog(
    BuildContext context, WasherWashsheetApproval car) {
  // set up the buttons
  Widget submitButton = FlatButton(
    child: Text("Submit"),
    onPressed: () {
      db
          .collection("UserCars")
          .doc(car.UId)
          .collection("AllHistory")
          .doc(car.WId)
          .set({
        "D": car.Day,
        "T": car.Time,
        "Dt": car.Date,
        "Rc": car.RcNo,
        "C": car.Name,
        "WaId": car.WaId,
        "WId": car.WId,
        "AsId": car.AsId,
        "UId": car.UId,
        "CId": car.CId,
      }).then((value) {
        db
            .collection("Washers")
            .doc(car.WaId)
            .collection("AllHistory")
            .doc(car.WId)
            .set({
          "D": car.Day,
          "T": car.Time,
          "Dt": car.Date,
          "Rc": car.RcNo,
          "C": car.Name,
          "WaId": car.WaId,
          "WId": car.WId,
          "AsId": car.AsId,
          "UId": car.UId,
          "CId": car.CId,
        }).then((value) {
          db
              .collection("CarAssigned")
              .doc(car.AsId)
              .collection("AllHistory")
              .doc(car.WId)
              .set({
            "D": car.Day,
            "T": car.Time,
            "Dt": car.Date,
            "Rc": car.RcNo,
            "C": car.Name,
            "WaId": car.WaId,
            "WId": car.WId,
            "AsId": car.AsId,
            "UId": car.UId,
            "CId": car.CId,
          }).then((value) {
            db
                .collection("CarAssigned")
                .doc(car.AsId)
                .collection("Rejected")
                .doc(car.WId)
                .delete();
            db
                .collection("Washers")
                .doc(car.WaId)
                .collection("Rejected")
                .doc(car.WId)
                .delete();
            db
                .collection("UserCars")
                .doc(car.UId)
                .collection("Rejected")
                .doc(car.WId)
                .delete();

            Fluttertoast.showToast(
                msg: 'Washsheet Approved',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.white,
                textColor: Colors.blue);
          });
        });
      });

      Navigator.pop(context);
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Approval" , style: TextStyle(color: Colors.blue,  fontWeight: FontWeight.bold),),
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

TextEditingController textEditingController1 = TextEditingController();

showRejectionAlertDialog(BuildContext context, WasherWashsheetApproval car) {
  // set up the buttons
  Widget submitButton = FlatButton(
    child: Text("Submit"),
    onPressed: () {
      db
          .collection("UserCars")
          .doc(car.UId)
          .collection("Rejected")
          .doc(car.WId)
          .set({
        "D": car.Day,
        "T": car.Time,
        "Dt": car.Date,
        "Rc": car.RcNo,
        "C": car.Name,
        "WaId": car.WaId,
        "WId": car.WId,
        "AsId": car.AsId,
        "UId": car.UId,
        "CId": car.CId,
      }).then((value) {
        db
            .collection("Washers")
            .doc(car.WaId)
            .collection("Rejected")
            .doc(car.WId)
            .set({
          "D": car.Day,
          "T": car.Time,
          "Dt": car.Date,
          "Rc": car.RcNo,
          "C": car.Name,
          "WaId": car.WaId,
          "WId": car.WId,
          "AsId": car.AsId,
          "UId": car.UId,
          "CId": car.CId,
        }).then((value) {
          db
              .collection("CarAssigned")
              .doc(car.AsId)
              .collection("Rejected")
              .doc(car.WId)
              .set({
            "D": car.Day,
            "T": car.Time,
            "Dt": car.Date,
            "Rc": car.RcNo,
            "C": car.Name,
            "WaId": car.WaId,
            "WId": car.WId,
            "AsId": car.AsId,
            "UId": car.UId,
            "CId": car.CId,
          }).then((value) {
            db
                .collection("CarAssigned")
                .doc(car.AsId)
                .collection("Approval")
                .doc(car.WId)
                .delete();
            db
                .collection("Washers")
                .doc(car.WaId)
                .collection("Approval")
                .doc(car.WId)
                .delete();
            db
                .collection("UserCars")
                .doc(car.UId)
                .collection("Approval")
                .doc(car.WId)
                .delete();

            Fluttertoast.showToast(
                msg: 'Washsheet Rejected',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.white,
                textColor: Colors.blue);
          });
        });
      });

      Navigator.pop(context);
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Rejection" , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold),),
    actions: [cancelButton, submitButton],
    content: Wrap(
      children: [
        TextField(
          maxLines: 5,
          controller: textEditingController1,
          keyboardType: TextInputType.name,
          style: TextStyle(
            fontSize: 15,
            color: Colors.blue,
          ),
          decoration: InputDecoration(
            fillColor: Colors.blue,
            focusColor: Colors.blue,
            hoverColor: Colors.blue,
            labelText: 'Reason',
            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            labelStyle: TextStyle(
              color: Colors.blue,
            ),
            enabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(20.0)),
            disabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(20.0)),
            focusedBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
      ],
    ),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
