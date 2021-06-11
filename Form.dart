import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cupertino_date_picker/date_picker_widget.dart';
import 'package:party_app/MemberDashboard.dart';
import 'package:party_app/Model/Classes.dart';
import 'package:party_app/ThankYouPage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Form_Page extends StatefulWidget {

  String Number , Uid;
  Form_Page(this.Number , this.Uid);

  @override
  _Form_PageState createState() => _Form_PageState();
}

class _Form_PageState extends State<Form_Page> {

  final db = FirebaseFirestore.instance;

  final auth_user = FirebaseAuth.instance;
  String UserId ;
  String birthDate = "";
  int age = -1;

  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  TextEditingController textEditingController8 = TextEditingController();

  bool checkedValue1 = false ;
  bool checkedValue2 = false ;

  int selectedRadioTile = 1;
  PickedFile  _image;
  File _imageFile;
  String fileName , filePath = "" ;
  String _uploadedFileURL;




  _imgFromCamera() async {
    PickedFile image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
      _imageFile = File(image.path);
    });
  }

  _imgFromGallery() async {
    PickedFile image = await  ImagePicker.platform.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
      _imageFile = File(image.path);
    });
  }


  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }




  @override
  void initState() {
    super.initState();
    setState(() {
      selectedRadioTile = 1;
    });
    //_getStatesList();

    if(widget.Uid == "UserId"){

      UserId = auth_user.currentUser.uid;

      db.collection("Users").doc(UserId).set({
        "T": "DN"
      });

    }else{

      UserId = widget.Uid ;

      db.collection("Users").doc(UserId).set({
        "T": "DN"
      });
    }

  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  Future uploadFile(PickedFile file ) async {
    if (file == null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Dp')
        .child(UserId);

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});


    uploadTask = ref.putFile(File(file.path), metadata);


    Future.value(uploadTask).whenComplete(() async {


      String u =  await ref.getDownloadURL();

      db.collection("Users").doc(UserId).set({
        "T": "User",
        "RegNum": widget.Number,
        "FN": textEditingController1.text.trim(),
        "LN": textEditingController2.text.trim(),
        "G": selectedRadioTile == 1 ? "Male" : (selectedRadioTile) == 2 ? "Female" : "Other",
        "DOB": birthDate,
        "Age": age,
        "DP": u,
        "Email": textEditingController6.text.isEmpty ? "NS" : textEditingController6.text.trim(),
        "Id": "AGP"+ "12345",
        "EmailV": "NoV",
        "Alternate Number": "NS",
        "Alternate Email": "NS",
        "Edu": "NS",
        "State": "NS",
        "District": "NS",
        "Const": "NS",
        "Pincode": "NS",
        "LSConst": "NS",
      }).whenComplete(() {


        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Thank_You_Page()), (route) => false);


      });

      // String url = ref.getDownloadURL() as String;
      // return url ;
    });
  }
  // }

  // Future uploadFile(String name) async {
  //   firebase_storage.Reference storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('dp/${name}');
  //
  //   firebase_storage.UploadTask uploadTask;
  //
  //   uploadTask = storageReference.putFile();
  //
  //   //await uploadTask.onComplete;
  //   print('File Uploaded');
  //   storageReference.getDownloadURL().then((fileURL) {
  //     setState(() {
  //       _uploadedFileURL = fileURL;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Membership Form" , style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),

              Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    _showPicker(context);
                  },
                  child: Stack(
                    children: [

                      _image != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.file(
                          File(_image.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ):
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.black12,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/logo.jpg'),
                        ),
                      ),


                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: AssetImage('assets/editIcon.png'),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              SizedBox(height: 10,),

              Center(child: Text('Registered Mobile Number : ' + widget.Number , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold) , textAlign: TextAlign.center,)),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RowTextFie("First Name", textEditingController1),
                      SizedBox(width: 10,),
                      RowTextFie("Last Name", textEditingController2),
                    ],
                  ),
                ),
              ),

              //SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                child: Text("Gender" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child:

                      RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only( // Add this
                            left: 5,
                            right: 0,
                            bottom: 0,
                            top: 0
                        ),
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text("Male" , style: TextStyle(color: Colors.black),),
                        onChanged: (val) {
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.indigo,
                        selected: true,
                      ),



                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child:
                      RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only( // Add this
                            left: 5,
                            right: 0,
                            bottom: 0,
                            top: 0
                        ),
                        value: 2,
                        groupValue: selectedRadioTile,
                        title: Text("Female" , style: TextStyle(color: Colors.black),),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.indigo,

                        selected: false,
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.loose,
                      child:
                      RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only( // Add this
                            left: 5,
                            right: 0,
                            bottom: 0,
                            top: 0
                        ),
                        value: 3,
                        groupValue: selectedRadioTile,
                        title: Text("Other" , style: TextStyle(color: Colors.black),),
                        onChanged: (val) {
                          print("Radio Tile pressed $val");
                          setSelectedRadioTile(val);
                        },
                        activeColor: Colors.indigo,
                        selected: false,
                      ),
                    ),

                  ],
                ),
              ),



              age == -1 ?
               Row(
                children: [
                  DOB(),
                  SizedBox(width: 10,),
                  Text("DOB Not Selected" , style: TextStyle(fontSize: 13),),

                ],
              ) : Row(
                children: [
                  DOB(),
                  SizedBox(width: 10,),
                  Text("Age : " + age.toString() , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),

                ],
              ),


              TextFie("Email Address* ( Optional )", textEditingController6),


              CheckboxListTile(
                title: Text("I have been a AGP Member in the past."),
                value: checkedValue1,
                checkColor: Colors.white,
                activeColor: Colors.indigo,
                onChanged: (newValue) {

                  setState(() {
                    checkedValue1 = newValue;
                  });

                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),



              CheckboxListTile(
                title: Text("I accept the membership Terms and Conditions & Constitution as specified in the AGP constitution. I agree to be communicated to by the party via phone, SMS, email and other means. I am above 18 years of age and not a member of any other Political Party."),
                value: checkedValue2,
                checkColor: Colors.white,
                activeColor: Colors.indigo,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue2 = newValue;
                  });

                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),

              SizedBox(height: 20,),


              GestureDetector(
                  onTap: () async {

                    if(checkedValue1 && checkedValue2){

                      if(age != -1){

                        if(textEditingController1.text.isNotEmpty && textEditingController2.text.isNotEmpty){

                          if(_image != null){


                            uploadFile(_image);

                            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Thank_You_Page()), (route) => false);



                          }else{

                            db.collection("Users").doc(UserId).set({
                              "T": "User",
                              "RegNum": widget.Number,
                              "FN": textEditingController1.text.trim(),
                              "LN": textEditingController2.text.trim(),
                              "G": selectedRadioTile == 1 ? "Male" : (selectedRadioTile) == 2 ? "Female" : "Other",
                              "DOB": birthDate,
                              "Age": age,
                              "DP": "d",
                              "Email": textEditingController6.text.isEmpty ? "NS" : textEditingController6.text.trim(),
                              "Id": "AGP"+ "12345",
                              "EmailV": "NoV",
                              "Alternate Number": "NS",
                              "Alternate Email": "NS",
                              "Edu": "NS",
                              "State": "NS",
                              "District": "NS",
                              "Const": "NS",
                              "Pincode": "NS",
                              "LSConst": "NS",
                            }).whenComplete(() {


                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Thank_You_Page()), (route) => false);


                            });

                          }

                        }else{

                          Fluttertoast.showToast(
                              msg: "Please Fill First Name & Last Name",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.indigo,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        }




                      }else{

                        Fluttertoast.showToast(
                            msg: "Please Select Your Date Of Birth",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.indigo,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );

                      }



                    }else{

                      Fluttertoast.showToast(
                          msg: "Check boxes needs to be checked",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.indigo,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );

                    }
                    },
                  child: Card1("Submit")),


              SizedBox(height: 20,),
            ],


          ),
        ),
      ),

    );
  }

  selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    Completer completer = Completer();
    String _selectedDateInString;
    if (Platform.isAndroid)
      showDatePicker(
          context: context,
          initialDate: initialDateTime,
          firstDate: DateTime(1970),
          lastDate: lastDate == null
              ? DateTime(initialDateTime.year + 10)
              : lastDate)
          .then((temp) {
        if (temp == null) return null;
        completer.complete(temp);
        setState(() {});
      });
    else
      DatePicker.showDatePicker(
        context,
        dateFormat: 'yyyy-mmm-dd',
        locale: 'en',
        onConfirm2: (temp, selectedIndex) {
          if (temp == null) return null;
          completer.complete(temp);

          setState(() {});
        },
      );
    return completer.future;
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;

    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }



  Widget DOB(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      child: GestureDetector(
        onTap: () async {

          DateTime birthDate = await selectDate(context, DateTime.now(),
              lastDate: DateTime.now());
          final df = new DateFormat('dd-MMM-yyyy');
          this.birthDate = df.format(birthDate);
          this.age = calculateAge(birthDate);

          setState(() {});

        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
          ),
          height: MediaQuery.of(context).size.height/15,
          width: MediaQuery.of(context).size.width/2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Date Of Birth",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Card1(String Txt){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        height: MediaQuery.of(context).size.height/13,
        width: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget RowTextFie(String hint, TextEditingController textEditingController) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/2.2),
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.black),
          child: TextField(
            keyboardType: TextInputType.text,
            maxLines: 1,
            controller: textEditingController,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              fillColor: Colors.black,
              focusColor: Colors.black,
              hoverColor: Colors.black,
              labelText: hint,
              contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                  borderSide:
                  const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)),
              disabledBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                  borderSide:
                  const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)),
              focusedBorder: OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                  borderSide:
                  const BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      ),
    );
  }


  Widget TextFie(String hint, TextEditingController textEditingController) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
        child: Container(
          constraints: BoxConstraints(maxWidth: 800 , minWidth: 200),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.black),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                controller: textEditingController,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  labelText: hint,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  disabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                      borderSide:
                      const BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }








}
