import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {

  double percentage = 0.0 ;

  File _image;
  final db = Firestore.instance;
  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();
  TextEditingController subnameController = TextEditingController();
  TextEditingController subdescController = TextEditingController();
  String subname = "";
  String subdesc = "";
  var now = new DateTime.now();
  var day = new DateFormat('yyyyMMdd');
  var id = new DateFormat('yyyyMMddHHmmss');
  var noteDate = DateFormat("dd-MM-yy");

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      percentage = 0.0 ;
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        child: ListView(
          scrollDirection: Axis.vertical,

          children: <Widget>[





            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: _image == null ? Text('No image selected.') : Image.file(_image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed:getImage,
                child: const Text('Select Image', style: TextStyle(fontSize: 20)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: subnameController,
                onChanged: (value) {
                  subname = value;
                  print('subject name ---- $subname');

                },
                style: TextStyle(
                  fontSize: 20,
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: subdescController,
                onChanged: (value) {
                  subdesc = value;
                  print('subject desc ---- $subdesc');

                },

              ),
            ),
            Padding(
              padding:EdgeInsets.all(10.0),
              child: Center(child: Text( 'Progress - $percentage', style: TextStyle(fontSize: 20))),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: false,
                lineHeight: 30.0,
                animationDuration: 1000,
                percent: percentage/100,
                center: Text('$percentage %' , style: TextStyle(color: Colors.white),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.indigo,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                onPressed:addImageToFirebase,
                child: const Text('Add Image', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
    );
  }

//Creating a global Variable
  StorageReference storageReference = FirebaseStorage.instance.ref();

  void addImageToFirebase() async {

    var now = new DateTime.now();
    var id = new DateFormat('yyyyMMddHHmmss');
    final String Id = id.format(now);

    //CreateRefernce to path.
    StorageReference ref = storageReference.child("Icons/");

    //StorageUpload task is used to put the data you want in storage
    //Make sure to get the image first before calling this method otherwise _image will be null.

    StorageUploadTask storageUploadTask = ref.child(Id).putFile(_image);

    if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
      final String url = await ref.getDownloadURL();
      print("The download URL is " + url);
    } else if (storageUploadTask.isInProgress) {
      storageUploadTask.events.listen((event) {
        double percentage2 = 100 *(event.snapshot.bytesTransferred.toDouble()
            / event.snapshot.totalByteCount.toDouble());
        setState(() {
          percentage =  double.parse((percentage2).toStringAsFixed(2));
          print("The percentage " + percentage.toString());
        });
      });

      StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
      String downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();

      if(downloadUrl1 != null){
        createData(downloadUrl1);
        print("Download URL " + downloadUrl1.toString());
      }

      //Here you can get the download URL when the task has been completed.


    } else{
      //Catch any cases here that might come up like canceled, interrupted
    }

  }

  void createData(String dw) async {

    final String Id = id.format(now);

    if(Id != null){

      db.collection("Subjects").document(Id).setData(
          {
            "SubName" : subname,
            "SubDesc" : subdesc,
            "Image" : dw,
          }).then((_){
        print("success!");
        print(Id);
      });

    }

  }




}

