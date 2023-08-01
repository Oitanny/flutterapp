import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
//import 'package:mscapp/screens/alumni.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:mscapp/screens/input_feild.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';
import 'home.dart';
import 'dart:convert';
import 'package:path/path.dart' as Path;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class Publish extends StatefulWidget {
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  DateTime today = DateTime.now();
  String? date;
  String selectedFile = "N/A";
  CollectionReference users =
      FirebaseFirestore.instance.collection("Published_Opportunity");
  // String? criteria;
  // String? fname;
  // String? lname;
  String? roles;
  String? Department;
  // String? mail;
  // String? phn;
  String? Oppo;
  String _fileText = "UPLOAD JOB DESCRIPTION";
  String? filename;
  // String? company;
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phn = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController comp = TextEditingController();
  TextEditingController eligi = TextEditingController();
  TextEditingController jprof = TextEditingController();
  _launchURL() async {
    const url = 'https://t.me/+I9VP_oFCLxc1MmVl';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // void validate() {
  //   if (formKey.currentState.validate()) {
  //     print("validate");
  //   } else {
  //     print("Not Validate");
  //   }
  // }

  // String validatepass(value) {
  //   if (value.isEmpty) {
  //     return "Required";
  //   } else {
  //     return null;
  //   }
  // }
  Uint8List? uploadfile;
  List<String> dept = [
    "Commerce",
    "Economics",
    "English",
    "Hindi",
    "Mathematics",
    "Philosophy",
    "Political Science",
    "Punjabi",
    "Statistics",
    "Computer Science",
    "Elementary Education",
    "Environmental Science",
    "History",
    "Physical Education",
    "Psychology",
    "Sanskrit",
    "Urdu"
  ];
  String? _selectedDept;
  List<String> role = [
    "Alumni",
    "Admin",
    "Student",
  ];
  String? _selectedrole;
  List<String> typeOpp = ["Internship", "Placement", "Internship with PPO"];
  String? _selectedOpp;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> listofFiles = [];
  List<Uint8List> listofUploads = [];
  int ct = 0;
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
    String o = "NA", r = "NA", d = "NA";
    Color colDrop = Colors.black54;
    final _formKey = GlobalKey<FormState>();
    bool success = true;
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
          centerTitle: false,
          title: Text(
            'Publish Job and Internship Opportunity',
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
        drawer: SideMenu(),
        // floatingActionButton: FloatingActionButton(
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
        //       // child: Image(image: AssetImage('images/boat.jpg'))
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage('images/boat.jpg')),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Fill this Form to Publish an Opportunity. ",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.grey[800], letterSpacing: .2),
                          ),
                          textAlign: TextAlign.left,
                        ))),
                SizedBox(
                  height: 2.0,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Fill all the mandatory fields marked with '*'",
                            style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(color: Colors.red, letterSpacing: .2),
                            ),
                            textAlign: TextAlign.left))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFFF0F0F0),
                  ),
                  //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 45),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Container(
                    //autovalidate: false,
                    //key: formKey,
                    child: SingleChildScrollView(
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 55,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          // validator: (value) {
                                          //   if (value == null || value == "") {
                                          //     return "Please enter the first name";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: fname,
                                          // onChanged: (value) {
                                          //   fname = value;
                                          // },
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            errorStyle:
                                                const TextStyle(fontSize: 0.01),
                                            labelText: "First Name",
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        // InputFeild(
                                        //  hint: "* First Name",
                                        //),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: lname,
                                          // onChanged: (value) {
                                          //   lname = value;
                                          // },
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            labelText: "Last Name",
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        // InputFeild(
                                        //  hint: "* First Name",
                                        //),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, //background color of dropdown button
                                    border: Border.all(
                                      color: colDrop,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        15), //border raiuds of dropdown button
                                  ),
                                  child: DropdownButtonFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    isExpanded: true,
                                    // underline: Container(),
                                    hint: Text(
                                      '* Select your Role',
                                      style: GoogleFonts.roboto(),
                                    ),
                                    style: TextStyle(
                                      color: Colors.grey[850],
                                      fontSize: 15,
                                    ),
                                    value: _selectedrole,
                                    onChanged: (newValue) {
                                      roles = newValue as String?;
                                      setState(() {
                                        _selectedrole = newValue as String?;
                                        r = _selectedrole!;
                                        print("r=" + r + "\n");
                                        date =
                                            "${today.day}-${today.month}-${today.year}";
                                      });
                                    },
                                    items: role.map((roles) {
                                      return DropdownMenuItem(
                                        child: new Text(roles),
                                        value: roles,
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 55,
                                  child: TextFormField(
                                    controller: mail,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return "Please enter the email";
                                      }
                                      return null;
                                    },
                                    // onChanged: (value) {
                                    //   mail = value;
                                    // },
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      labelText: "* Enter your Email Id",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                    height: 55,
                                    child: Row(children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          controller: phn,
                                          // onChanged: (value) {
                                          //   phn = value;
                                          // },
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            labelText: "Enter your phone number",
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])),
                                SizedBox(
                                  height: 20.0,
                                ),
                                /*Container(
                                    height: 55,
                                    child: Row(children: <Widget>[*/
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, //background color of dropdown button
                                    border: Border.all(
                                      color: colDrop,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        15), //border raiuds of dropdown button
                                  ),
                                  child: DropdownButtonFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    isExpanded: true,
                                    // underline: Container(),
                                    hint: Text(
                                      '* Select your Department',
                                      style: GoogleFonts.roboto(),
                                    ),
                                    style: TextStyle(
                                      color: Colors.grey[850],
                                      fontSize: 15,
                                    ),
                                    value: _selectedDept,
                                    onChanged: (newValue) {
                                      Department = newValue as String?;
                                      setState(() {
                                        _selectedDept = newValue as String?;
                                        d = _selectedDept!;
                                        print("d=" + d + "\n");
                                      });
                                    },
                                    items: dept.map((depts) {
                                      return DropdownMenuItem(
                                        child: new Text(depts),
                                        value: depts,
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, //background color of dropdown button
                                    border: Border.all(
                                      color: colDrop,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        15), //border raiuds of dropdown button
                                  ),
                                  child: DropdownButtonFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    isExpanded: true,
                                    // underline: Container(),
                                    hint: Text(
                                      '* Type of Opportunity',
                                      style: GoogleFonts.roboto(),
                                    ),
                                    style: TextStyle(
                                      color: Colors.grey[850],
                                      fontSize: 15,
                                    ),
                                    value: _selectedOpp,
                                    onChanged: (newValue) {
                                      Oppo = newValue as String?;
                                      setState(() {
                                        _selectedOpp = newValue;
                                        o = _selectedOpp!;
                                        print("o=" + o + "\n");
                                      });
                                    },
                                    items: typeOpp.map((options) {
                                      return DropdownMenuItem(
                                        child: new Text(options),
                                        value: options,
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: comp,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value == "") {
                                      return "Please enter the company name";
                                    }
                                    return null;
                                  },
                                  // onChanged: (value) {
                                  //   company = value;
                                  // },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelText:
                                        "* Name of the Company/Organization",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: jprof,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value == "") {
                                      return "Please enter info regarding profile(s)";
                                    }
                                    return null;
                                  },
                                  // onChanged: (value) {
                                  //   company = value;
                                  // },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    labelText:
                                    "* Profiles/Roles Offered",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
                                  controller: eligi,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value == "") {
                                      return "Please enter the criteria";
                                    }
                                    return null;
                                  },
                                  // onChanged: (value) {
                                  //   criteria = value;
                                  // },
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    labelText: "* Eligibility Criteria",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          selectedFile == "N/A"
                                              ? "Only 1 document can be uploaded for job profile"
                                              : selectedFile,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.grey[800],
                                                letterSpacing: .2),
                                          ),
                                          textAlign: TextAlign.left,
                                        ))),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Row(
                                    //Row(
                                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 120,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(9), //
                                            ),
                                            primary: Colors.amber,
                                            onPrimary: Colors.white,
                                          ),
                                          child: Text(
                                            _fileText,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          onPressed: () => uploadFile(),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 120,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(9), //
                                              ),
                                              primary: Color(0XFF04C300),
                                              onPrimary: Colors.white,
                                            ),
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
                                            onPressed: () async{
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // setState(() {
                                                //   colDrop = Colors.red;
                                                // });
                                                showAlertDialog(context);
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
    fs.Reference storageRef = fs.FirebaseStorage.instance
        .ref()
        .child('publishedOpp/')
        .child('$filename');

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
          await users.add({
            "Fname": fname.text,
            "Lname": lname.text,
            "criteria": eligi.text,
            "Role": roles,
            "oppo": Oppo,
            "company": comp.text,
            "dep": Department,
            "email": mail.text,
            "phn": phn.text,
            "date": date,
            "profiles": jprof.text,
          }).then((value) async {
            for (int i = 0; i < listofFiles.length; i++) {
              await submitFiles(listofFiles[i], listofUploads[i]);
            }
          }).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tabsPage(selectedIndex: 0)),
            );
            Fluttertoast.showToast(
                msg: "Published Opportunity successfully!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM_RIGHT,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
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
      title: Text("Publish"),
      content: Text("Do you want to publish this opportunity?"),
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
