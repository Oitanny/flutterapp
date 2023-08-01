import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'tabsPage.dart';
import 'sideMenu.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'home.dart';
import 'package:path/path.dart' as Path;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class RaiseIssue extends StatefulWidget {
  _RaiseIssueState createState() => _RaiseIssueState();
}

class _RaiseIssueState extends State<RaiseIssue> {
  CollectionReference raise =
      FirebaseFirestore.instance.collection("raised_issues");
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phn = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController issue = TextEditingController();
  TextEditingController wissue = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _fileText = "Nothing was selected";
  Uint8List? uploadfile;
  String? filename;
  String? date;
  DateTime today = DateTime.now();
  List<String> listofFiles = [];
  List<Uint8List> listofUploads = [];
  int ct = 0;

  @override
  Widget build(BuildContext context) {
    Future<bool> success;
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
              'Raise An Issue',
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
          //   heroTag: 'btn11',
          //   onPressed: () async {
          //     if(await canLaunchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
          //       await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),mode: LaunchMode.externalApplication);
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
            Stack(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: AssetImage('images/boat.jpg')),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 15.0),
                  padding: EdgeInsets.only(left: 25.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Grievance",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          )))),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 15.0),
                  padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Redressal",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        textAlign: TextAlign.left,
                      ))),
            ]),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fill Grievance Form to Raise an Issue",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.grey[800], letterSpacing: .2),
                      ),
                      textAlign: TextAlign.left,
                    ))),
            SizedBox(
              height: 1.5,
            ),
            Padding(
                padding: EdgeInsets.only(left: 15.0),
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
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: SingleChildScrollView(child:Form(
                    //autovalidate: false,
                    key: formKey,
                    child: Column( children: <
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
                          controller: issue,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String? val) {
                            if (val == "") {
                              return "Issue subject can't be empty";
                            } else if (val!.length < 10) {
                              return "Issue subject must be atleast 10 characters long";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: "*Subject for issue",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)))),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                          controller: wissue,
                          validator: (val) {
                            if (val == "") {
                              return "Issue description can't be empty!";
                            } else if (val!.length < 10) {
                              return "Issue subject must be atleast 10 characters long";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 2,
                          decoration: InputDecoration(
                              labelText: "*Write your issue",
                              hintText: "Enter issue here",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0)))),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              //padding: EdgeInsets.all(2),
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 40),
                              child: ElevatedButton(
                                onPressed: () => uploadFile(),
                                // color: Color(0xFFFFBA15),
                                // shape: RoundedRectangleBorder(
                                //   borderRadius:
                                //       BorderRadius.all(Radius.circular(10.0)),
                                // ),
                                child: Text(
                                  "UPLOAD\nDOCUMENTS",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
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
                                      fontSize: 12,
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
                      Container(
                          child: Text(
                        _fileText,
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(
                        height: 30.0,
                      ),
                    ])))),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.purple[800],
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
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
            ),
          ])))),
    );
  }

  Future uploadFile() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'jpeg','txt','doc','pdf'],
          withData: true
      );
    } catch (e) {
      print(e);
    }

    if (result != null) {
      try {
        setState(() {
          uploadfile = result!.files.single.bytes;
          listofUploads.add(uploadfile!);
          print(uploadfile?.toString());
          filename = Path.basename(result.files.single.name);
          listofFiles.add(filename!);
          if (ct == 0) {
            _fileText = filename!;
            ct++;
          } else {
            _fileText = _fileText + ", " + filename!;
          }
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
        fs.FirebaseStorage.instance.ref().child('raise-issue-files/$filename');

    final fs.UploadTask? uploadTask = storageRef.putData(
        uploadfile!, fs.SettableMetadata(contentType: setUpldType + fext));

    final fs.TaskSnapshot? downloadUrl = await uploadTask;

    final String attchurl = (await downloadUrl!.ref.getDownloadURL());
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
          await raise
              .add({
                "Fname": fname.text,
                "Lname": lname.text,
                "issue": issue.text,
                "wissue": wissue.text,
                "email": mail.text,
                "phn": phn.text,
                "date": date,
              })
              .then((value) async {
                for (int i = 0; i < listofFiles.length; i++) {
                  await submitFiles(listofFiles[i], listofUploads[i]);
                }
              })
              .then((value) => Fluttertoast.showToast(
                  msg: "The issue has been sent to the admin email, please keep a check on your mail for the reply within this week ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0))
              .then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => tabsPage(selectedIndex: 0)),
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
      title: Text("Raise Issue"),
      content: Text("Do you want to raise this issue?"),
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
}
