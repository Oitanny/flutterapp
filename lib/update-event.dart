import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mscapp/options.dart';
import 'home.dart';
import 'tabsPage.dart';
import 'package:path/path.dart' as Path;
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() => runApp(UpdateEvent());

class UpdateEvent extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Event Form',
      // Application theme data, we can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpdateEventPage(),
    );
  }
}

class UpdateEventPage extends StatefulWidget {
  @override
  AddEventForm createState() {
    return AddEventForm();
  }
}

class AddEventForm extends State<UpdateEventPage> {
  Uint8List? uploadfile;
  String? filename;
  String? previousTitle;
  List<String> regList = [];
  List<String>? curropt = [
    '—',
    'Title',
    'Event Date',
    'Poster',
    'Event Deadline',
    'Event info',
    'Registration Link'

  ];
  final formKey = GlobalKey<FormState>();
  // final passwordController = TextEditingController();
  // final confirmpasswordController = TextEditingController();
  String? title1;
  String? chosen = null;
  String? x;
  String? currSel = null;
  DateTime? isDate;
  String? info;
  String _filetext = "Nothing selected";

  // String? chosen2 = "Select an event";
  TextEditingController dateinput = TextEditingController();
  //TextEditingController ddlineinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    CollectionReference _firestore = FirebaseFirestore.instance.collection('registration_ids_devices');
    getAllReg(_firestore);
    super.initState();
  }

  void dateset(TextEditingController x) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime(2020),
         //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => yyyy-mm-dd 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  dd-mm-yyyy

      setState(() {
        x.text = formattedDate; //set output date to TextField value.
        isDate = pickedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => Options(),
            ),
          ),
        ),
        // The title text which will be shown on the action bar
        title: Text('Update an Event'),
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
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('events')
                          .snapshots(),
                      builder: (context, snapshot) {
                        List<String> currentEvents = [];
                        if (!snapshot.hasData) {
                          Text('Loading...');
                        } else {
                          for (int i = 0; i < snapshot.data!.docs.length; i++) {
                            DocumentSnapshot snap = snapshot.data!.docs[i];
                            currentEvents.add(snap["title"]);
                          }
                        }
                        // DropdownMenuItem(
                        //       child: Text(snap[
                        return Container(
                            margin: EdgeInsets.all(10),
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              items: currentEvents.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (curreveVal) {
                                setState(() {
                                  chosen = curreveVal.toString();
                                  x = chosen;
                                  title1 = x;
                                  previousTitle=x;
                                  chosen = null;
                                });
                              },
                              value: x,
                              hint: Text("Choose an Event"),
                            ));
                        //return Text("Hi");
                      }),

                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('What do you want to update?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  // Container(
                  //     margin: EdgeInsets.all(2),
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: TextFormField(
                  //       autovalidateMode: AutovalidateMode.onUserInteraction,
                  //       validator: (String? val) {
                  //         if (val == null || val.isEmpty) {
                  //           return 'Event title cannot be empty';
                  //         }
                  //         return null;
                  //       },
                  //       decoration: InputDecoration(
                  //           filled: true, //<-- SEE HERE
                  //           fillColor: Colors.white,
                  //           //labelText: 'Username',
                  //           hintText: 'Choose event',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20.0),
                  //           )),
                  //       // onTap: () {
                  //       //   showSearch(context: context, delegate: Search());
                  //       // }),
                  //     )),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      items: curropt?.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (item) => setState(() => {
                            currSel = item,
                          }),
                      value: currSel,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, bottom: 2),
                    child: Text('Updated Information',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                  if (currSel == null)
                    Container(
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            //labelText: 'Username',
                            hintText: '-',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                    )
                  else if (currSel == curropt?[1] || currSel == curropt?[5]||currSel==curropt?[6])
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: 200,
                      margin: EdgeInsets.all(2),
                      padding: const EdgeInsets.all(8.0),

                      child: TextFormField(
                        maxLines: 8, //or null
                        textAlign: TextAlign.left,

                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return 'This field cannot be empty';
                          } else {
                            info = val;
                          }
                          //  else if (val.length < 50) {
                          //   return 'Event information must be at least 50 charcters long.';
                          // }
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
                    )
                  else if (currSel == curropt?[3])
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: uploadFile,
                          child: Text(
                            _filetext,
                            style: TextStyle(fontSize: 14),
                          ),
                        ))
                  else if (currSel == curropt?[2] || currSel == curropt?[4])
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
                  // Container(
                  //   margin: EdgeInsets.only(left: 12, bottom: 2),
                  //   child: Text('Poster/Brochure',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       )),
                  // ),

                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        // if ((isDate != null)) {
                        showAlertDialog(context);
                        // } else {
                        //   showToast();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff02b434), // Background color
                        //onPrimary: Color(0xfff80808), //Text Color (Foreground color)
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(35)),
                      ),
                      child: Text(
                        "Update Event",
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
  Future getAllReg(CollectionReference cr) async {


    await cr.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['reg_id']);
        regList.add(doc['reg_id']);
      });
    });

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
      onPressed: () {

        FirebaseFirestore.instance
            .collection("events")
            .where("title", isEqualTo: title1)
            .get()
            .then((value) {
          value.docs.forEach((element) async{
            if (currSel == curropt?[1])
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .update({
                "title": info,
              });
            else if (currSel == curropt?[2])
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .update({
                "date": dateinput.text,
              });
            else if(currSel==curropt?[3]){
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .update({
                "img": _filetext,
              }).then((value) => submitFiles(filename!, uploadfile!) );

            }
            else if (currSel == curropt?[4])
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .update({
                "ddline": dateinput.text,
              });
            else if (currSel == curropt?[5])
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .update({
                "info": info,
              });
          });
        })
        //     .then((value) async {
        //
        //
        // })
            .then((value) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tabsPage(selectedIndex: 0)),
          );
          if(currSel != curropt?[1])
          SendNewlyUpdatedEventNotification(x.toString(),x.toString(),regList);
          else
            SendNewlyUpdatedEventNotification(x.toString(),info.toString(),regList);
          Fluttertoast.showToast(
              msg: "Event updated successfully!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM_RIGHT,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Update " + title1!),
      content: Text("Do you want to update this event?"),
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
          print(result.files.single.name);
          String y= Path.basename(result.files.single.name);
          filename = x! + "." + y.split('.')[1];
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
    fs.FirebaseStorage.instance.ref().child('events/').child('$filename');

    final fs.UploadTask? uploadTask = storageRef.putData(
        uploadfile!, fs.SettableMetadata(contentType: setUpldType + fext));

    final fs.TaskSnapshot? downloadUrl = await uploadTask;

    final String attchurl = (await downloadUrl!.ref.getDownloadURL());
  }

  void showToast() => Fluttertoast.showToast(
      msg: "Please fill all the fields (correctly)", fontSize: 18);
}
Future<void> SendNewlyUpdatedEventNotification(String x, String scr, List<String> regList) async {
  String? deviceTokenToSendPushNotification;
  var url=Uri.parse('https://fcm.googleapis.com/fcm/send');
  var response = await http.post(url, body: jsonEncode({
    "registration_ids": regList,
    "notification": {
      "body": "$x\nClick to check out the details...",
      "title": "Event Updated!",
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