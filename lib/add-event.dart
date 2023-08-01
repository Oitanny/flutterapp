import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mscapp/options.dart';
import 'home.dart';
import 'tabsPage.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:convert';

import 'package:http/http.dart' as http;

void main() => runApp(Addevent());

class Addevent extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Event form',
      // Application theme data, we can set the colors for the application as
      // we want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddEventPage(),
    );
  }
}

enum TypeEvent { CentralEvent, DepartmentalEvent }

class AddEventPage extends StatefulWidget {
  @override
  AddEventForm createState() {
    return AddEventForm();
  }
}

class AddEventForm extends State<AddEventPage> {
  final formKey = GlobalKey<FormState>();
  // final passwordController = TextEditingController();
  // final confirmpasswordController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController ddlineinput = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _info = TextEditingController();
  TextEditingController _link = TextEditingController();
  List<String> regList = [];

  String? title;
  String? x;
  String? info;
  Uint8List? uploadfile;
  String? filename;
  String _filetext = "Upload Event Poster";
  String? _eventType;
  final eventRange = ["Central Event", "Departmental Event"];
  String? selectedValue;
  changeSelectedIndex(v) {
    setState(() {
      selectedValue = v;
      _eventType = v;
    });
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    ddlineinput.text = "";
    CollectionReference _firestore = FirebaseFirestore.instance.collection('registration_ids_devices');

    getAllReg(_firestore);

    super.initState();
  }

  void dateset(TextEditingController x) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => yyyy-mm-dd 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  dd-mm-yyyy

      setState(() {
        x.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text('Add Event'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => Options(),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("images/signupimg.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage("images/event-add.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Title of the event',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _title,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? val) {
                        if (val == null || val.isEmpty) {
                          return 'Event title cannot be empty';
                        } else if (val.length < 3) {
                          return 'Event title must be at least 3 charcters long.';
                        } else {
                          title = val;
                          x = val;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          //labelText: 'Username',
                          hintText: 'Enter Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ),
                  Container(
                    //child: Column(children: <Widget>[
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: eventRange.length,
                        itemBuilder: (context, index) {
                          return RadioListTile<String>(
                              value: eventRange[index],
                              groupValue: selectedValue,
                              selected: selectedValue == eventRange[index],
                              onChanged: changeSelectedIndex,
                              title: Text(eventRange[index]));
                        }),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Date of the Event',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.calendar_today), //icon of text field
                          //labelText: "Enter Date" //label text of field
                          hintText: "Select Date",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),

                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        dateset(dateinput);
                        // DateTime? pickedDate = await showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                        //     lastDate: DateTime(2101));

                        // if (pickedDate != null) {
                        //   print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        //   String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        //   print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //   //you can implement different kind of Date Format here according to your requirement

                        //   setState(() {
                        //     dateinput.text = formattedDate; //set output date to TextField value.
                        //   });
                        // } else {
                        //   print("Date is not selected");
                        // }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Event Information',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    // height: 200,
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),

                    child: TextFormField(
                      maxLines: 8, //or null
                      textAlign: TextAlign.left,
                      controller: _info,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? val) {
                        if (val == null || val.isEmpty) {
                          return 'Event information cannot be empty';
                        } else {
                          info = val;
                        }
                      },
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          //labelText: 'Confirm Password',
                          hintText: 'Enter info',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text(
                        'Event Registration Deadline',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller:
                          ddlineinput, //editing controller of this TextField

                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.calendar_today), //icon of text field
                          //labelText: "Enter Date" //label text of field
                          hintText: "Select Deadline",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),

                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        dateset(ddlineinput);
                        // DateTime? pickedDate = await showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                        //     lastDate: DateTime(2101));

                        // if (pickedDate != null) {
                        //   print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        //   String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        //   print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //   //you can implement different kind of Date Format here according to your requirement

                        //   setState(() {
                        //     dateinput.text = formattedDate; //set output date to TextField value.
                        //   });
                        // } else {
                        //   print("Date is not selected");
                        // }
                      },
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(2),
                  //   padding: const EdgeInsets.all(8.0),

                  //   ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Registration Link',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _link,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? val) {
                        if (val == null || val.isEmpty) {
                          return 'Registration Link cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          //labelText: 'Username',
                          hintText: 'Enter Registration Link',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Event Poster',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: uploadFile,
                        child: Text(
                          _filetext,
                          style: TextStyle(fontSize: 14),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          debugPrint('All validations passed');
                          showAlertDialog(context);
                        } else {
                          showToast();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // Background color
                        //onPrimary: Colors.black, //Text Color (Foreground color)
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(35)),
                      ),
                      child: Text(
                        "Add to events page",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   child: Text(
                  //     "Already have an account? ",
                  //     style: TextStyle(fontSize: 16),
                  //   ),
                  // ),
                  // Container(
                  //     child: TextButton(
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, 'login');
                  //         },
                  //         child: Text("Login",
                  //             style: TextStyle(
                  //               decoration: TextDecoration.underline,
                  //               fontSize: 18,
                  //               color: Colors.orange,
                  //             ))))
                  //
                  SizedBox(height: 50),
                ],
              ),
            )),
      ),
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
          await FirebaseFirestore.instance.collection('events').add({
            'date': dateinput.text,
            'ddline': ddlineinput.text,
            'info': _info.text,
            'title': _title.text,
            'img': filename,
            'type': _eventType,
            'link': _link.text,
          }).then((value) async {
            await submitFiles(filename!, uploadfile!);
          }).then((value) {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => tabsPage(selectedIndex: 0)),
            );

            //SendNewlyUpdatedEventNotification(x.toString(),x.toString(),regList);
            Fluttertoast.showToast(
                msg: "Event added successfully!",
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
      title: Text("Add " + title!),
      content: Text("Do you want to add this event?"),
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
          withData: true
      );
    } catch (e) {
      print(e);
    }

    if (result != null) {
      try {
        setState(() {
          uploadfile = result!.files.single.bytes;
          print(uploadfile?.toString());
          filename = Path.basename(result.files.single.name);
          _filetext =x!+"."+ filename.toString().split('.')[1];print(_filetext);
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
    fs.FirebaseStorage.instance.ref().child('events/').child('$filename');

    final fs.UploadTask? uploadTask = storageRef.putData(
        uploadfile!, fs.SettableMetadata(contentType: setUpldType + fext));

    final fs.TaskSnapshot? downloadUrl = await uploadTask;

    final String attchurl = (await downloadUrl!.ref.getDownloadURL());
  }
  Future getAllReg(CollectionReference cr) async {


    await cr.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['reg_id']);
        regList.add(doc['reg_id']);
      });
    });

  }
  void showToast() =>
      Fluttertoast.showToast(msg: "Please add an event", fontSize: 18);
}

Future<void> SendNewlyUpdatedEventNotification(String x, String scr, List<String> regList) async {
  String? deviceTokenToSendPushNotification;
  var url=Uri.parse('https://fcm.googleapis.com/fcm/send');
  var response = await http.post(url, body: jsonEncode({
    "registration_ids": regList,
    "notification": {
      "body": "$x\nClick to check out the details...",
      "title": "New Event Added!",
      "android_channel_id": "com.example.mscapp",
      "image":"https://images.shiksha.com/mediadata/images/1609322524phpbKd5dz.png",
      "sound": false
    },
    "data": {
      "title_event":"$scr"
    }

  }),
      headers: {
        'Content-type': 'application/json',
        "Authorization": "key=AAAAOKsTDcM:APA91bEi1FUSIHNdtcec9-rDT4fpJ3MmwFrlc6-06bWZFPCTkaP7ca5-0hpgMpMf45LTe1UmhQCyg9BHV-QhlB2A0vQHJV3EYA_rfvq0V3hURwnEGBzbjbauYTQKHJp2Nq07BVSZjlh3"}
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // final token = await _fcm.getToken();
  // deviceTokenToSendPushNotification = token.toString();
  // print("Token Value $deviceTokenToSendPushNotification");
}
