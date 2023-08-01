import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'home.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:path/path.dart' as Path;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Alumni extends StatefulWidget {
  @override
  _AlumniState createState() => _AlumniState();
}

class _AlumniState extends State<Alumni> {
  int? _value = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CollectionReference alumni = FirebaseFirestore.instance.collection("alumni");
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phn = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController currentlyp = TextEditingController();
  TextEditingController depart = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController course = TextEditingController();
  Uint8List? uploadfile;
  String? filename;
  String _filetext = "Upload Photo";
  String? date;
  DateTime today = DateTime.now();
  void validate() {
    if (formKey.currentState!.validate()) {
      print("validate");
    } else {
      print("Not Validate");
    }
  }

  String? validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => tabsPage(selectedIndex: 0)),
        );
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Alumni Record Form',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tabsPage(selectedIndex: 0)),
                    );
                    //Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   heroTag: 'btn2',
          //   onPressed: () async {
          //     if (await canLaunchUrl(
          //         Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
          //       await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),
          //           mode: LaunchMode.externalApplication);
          //     } else {
          //       Fluttertoast.showToast(msg: "Launch Application not found");
          //     }
          //   },
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       image: DecorationImage(
          //           image: AssetImage('images/chatbot.jpg'), fit: BoxFit.fill),
          //     ),
          //   ),
          // ),
          drawer: SideMenu(),
          body: SingleChildScrollView(
              child: SafeArea(
                  child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/alumni.jpg',
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fill this form to store the alumni details",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.grey[800], letterSpacing: .2),
                      ),
                      textAlign: TextAlign.left,
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 15.0, top: 1.5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Fill all the mandatory fields marked with '*'",
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.red, letterSpacing: .2),
                        ),
                        textAlign: TextAlign.left))),
            Container(

                width: 500.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Color(0xFFF0F0F0),
                ),
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                child:
                SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Form(
                    //autovalidate: false,
                    key: formKey,
                    child:Column(children: <
                                Widget>[
                      Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Expanded(
                                child: TextFormField(
                                    validator: (String? value) {
                                      if (value == null) {
                                        return "First Name can't be empty";
                                      } else if (value.length < 3) {
                                        return 'First Name must be at least 3 charcters long.';
                                      }
                                    },
                                    controller: fname,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        labelText: "* First Name",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))))),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                                child: TextFormField(
                                    controller: lname,
                                    decoration: InputDecoration(
                                        labelText: "Last Name",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0))))),
                          ])),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: phn,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Phone no. cannot be empty";
                            } else if (val!.length < 10 || val.length > 10) {
                              return "Phone no. must be 10 characters long!";
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "* Enter your Phone no.",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: course,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Course cannot be empty";
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "* Enter your course",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: depart,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Department cannot be empty";
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "* Enter your department",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: company,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "This field cannot be empty";
                            } else if (val!.length < 3) {
                              return "Field must atleast 3 character long";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "*Company's name",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          controller: currentlyp,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Salary cannot be empty";
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "* Enter your salary",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: des,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Designation cannot be empty";
                            }
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              labelText: "* Enter your designation",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: mail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required *"),
                            EmailValidator(
                                errorText: "Please enter valid email ID")
                          ]),
                          decoration: InputDecoration(
                              labelText: "* Enter your Email id",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          controller: description,
                          validator: (val) {
                            if (val == "") {
                              return "Description can't be empty!";
                            } else if (val!.length < 10) {
                              return "Description must be atleast 10 characters long";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 2,
                          decoration: InputDecoration(
                              labelText: "*Write description",
                              hintText: "Enter description here",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 12, bottom: 2),
                      //   child: Text('Select photo',
                      //       textAlign: TextAlign.left,
                      //       style: TextStyle(
                      //         fontSize: 15,
                      //       )),
                      // ),
                      Container(
                          margin: EdgeInsets.fromLTRB(10,10,10,2),
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: uploadFile,
                            child: Text(
                              _filetext,
                              style: TextStyle(fontSize: 14),
                            ),
                          )),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              //padding: EdgeInsets.all(2),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              child: ElevatedButton(
                                onPressed: () async {
                                  String errhap = "";
                                  setState(() {
                                    date =
                                        "${today.day}-${today.month}-${today.year}";
                                  });
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      showAlertDialog(context);
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                                // color: Color(0XFF04C300),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius:
                                //       BorderRadius.all(Radius.circular(10.0)),
                                // ),
                                child: Text(
                                  "SUBMIT",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ]))))),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.purple[800],
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text(
                    'matasundricollege.du@gmail.com',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                ],
              ),
            )
          ])))),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        try {
          await alumni.add({
            "Fname": fname.text,
            "Lname": lname.text,
            "company": company.text,
            "description": description.text,
            "email": mail.text,
            "phn": phn.text,
            "currentlyp": currentlyp.text,
            "course": course.text,
            "des": des.text,
            "depart": depart.text,
            "Notable_alumni": "",
            'img': filename,
          }).then((value) async {
            await submitFiles(filename!, uploadfile!);
          }).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Alumni()),
            );
          });
        } catch (err) {
          Fluttertoast.showToast(
              msg: "Error:${err.toString()}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM_RIGHT,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alumni Details"),
      content: Text("Do you want to submit your alumni details?"),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future uploadFile() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'jpeg'],
          withData: true);
    } catch (e) {
      print(e);
    }

    if (result != null) {
      try {
        setState(() {
          uploadfile = result!.files.single.bytes;
          print(uploadfile?.toString());
          print(result.files.single.name);
          filename = Path.basename(result.files.single.name);
          _filetext = filename.toString();
        });

        // fs.Reference storageRef = fs.FirebaseStorage.instance
        //     .ref()
        //     .child('raise-issue-files/$filename');

        // final fs.UploadTask? uploadTask = storageRef.putData(uploadfile!);

        // final fs.TaskSnapshot? downloadUrl = await uploadTask;

        // final String attchurl = (await downloadUrl!.ref.getDownloadURL());
      } catch (e) {
        print(e);
      }
    }
  }

  Future submitFiles(String filename, Uint8List uploadfile) async {
    String fext = filename.split('.')[1];
    String setUpldType;
    if (fext == "png" || fext == "jpeg" || fext == "jpg") {
      setUpldType = "image/";
    } else {
      setUpldType = "media/";
    }
    fs.Reference storageRef =
        fs.FirebaseStorage.instance.ref().child('alumni/').child('$filename');

    final fs.UploadTask? uploadTask = storageRef.putData(
        uploadfile!, fs.SettableMetadata(contentType: setUpldType + fext));

    final fs.TaskSnapshot? downloadUrl = await uploadTask;

    final String attchurl = (await downloadUrl!.ref.getDownloadURL());
  }

  void showToast() =>
      Fluttertoast.showToast(msg: "Please add alumni details", fontSize: 18);
}
