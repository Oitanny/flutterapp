import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mscapp/options.dart';
import 'home.dart';
import 'tabsPage.dart';

void main() => runApp(DeleteEvent());

class DeleteEvent extends StatelessWidget {
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
      home: DeleteEventPage(),
    );
  }
}

class DeleteEventPage extends StatefulWidget {
  @override
  DeleteEventForm createState() {
    return DeleteEventForm();
  }
}

class DeleteEventForm extends State<DeleteEventPage> {
  late DocumentReference _documentReference;
  final formKey = GlobalKey<FormState>();
  // final passwordController = TextEditingController();
  // final confirmpasswordController = TextEditingController();

  String? chosen;
  String? chosen2 = "Select an event";
  // var x;
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance.collection('events').get().then((val) {
  //     if (val.docs.length > 0) {
  //       print(val.docs.length);
  //       for (int i = 0; i < val.docs.length; i++) {
  //         currevent.add(val.docs[i].data()["title"]);
  //         print(val.docs[i].data()["title"]);
  //       }
  //     } else {
  //       print("Not Found");
  //     }
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Options()),
            );
          },
        ),
        // The title text which will be shown on the action bar
        title: Text('Delete an Event'),
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
                    child: Text('Name of the event',
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
                                  chosen2 = chosen;
                                });
                              },
                              value: chosen,
                              hint: Text("Choose an Event"),
                            ));
                        //return Text("Hi");
                      }),
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   child: DropdownButtonFormField<String>(
                  //     isExpanded: true,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //       ),
                  //     ),
                  //     value: chosen,
                  //     items: currevent.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //       );
                  //     }).toList(),
                  //     onChanged: (item) =>
                  //         setState(() => {chosen = item, chosen2 = item}),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 12, bottom: 2),
                  //   child: Text('Selected event',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       )),
                  // ),
                  Container(
                    margin: EdgeInsets.all(2),
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          //labelText: 'Username',
                          hintText: chosen,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            chosen2 != 'Select an event') {
                          showAlertDialog(context);
                        } else {
                          showToast();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xfff32112), // Background color
                        //onPrimary: Color(0xfff80808), //Text Color (Foreground color)
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(35)),
                      ),
                      child: Text(
                        "Delete Event",
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
        chosen = null;
        try {
          FirebaseFirestore.instance
              .collection("events")
              .where("title", isEqualTo: chosen2)
              .get()
              .then((value) {
            value.docs.forEach((element) {
              FirebaseFirestore.instance
                  .collection("events")
                  .doc(element.id)
                  .delete()
                  .then((value) {
                print("Success! in deleting " + chosen2!);
              });
            });
          }).then((value) {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => tabsPage(selectedIndex: 0)),
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
      title: Text("Delete " + chosen2!),
      content: Text("Do you want to delete this event?"),
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

void showToast() =>
    Fluttertoast.showToast(msg: "Please select an event", fontSize: 18);
