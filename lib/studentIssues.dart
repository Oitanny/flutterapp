import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mscapp/dynamicRaisedIssue.dart';
import 'package:mscapp/options.dart';
import 'home.dart';
import 'tabsPage.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as Path;

class RaisedStudentIssues extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Raised Issues by Students',
      // Application theme data, we can set the colors for the application as
      // we want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RaisedStudentIssuesPage(),
    );
  }
}

class RaisedStudentIssuesPage extends StatefulWidget {
  @override
  RaisedStudentIssuesMain createState() {
    return RaisedStudentIssuesMain();
  }
}

class RaisedStudentIssuesMain extends State<RaisedStudentIssuesPage> {
  String d = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text('Raised Issues by Students'),
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

          // color: Color.fromARGB(255, 215, 146, 255),
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Container(

                      child: Column(children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
                child: StreamBuilder(

                    stream: FirebaseFirestore.instance
                        .collection('raised_issues')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(

                            height: MediaQuery.of(context).size.height - 30,
                            child: ListView(
                                controller: ScrollController(),
                                children: snapshot.data!.docs.map((document) {
                                  try {
                                    d = document["date"].toString();
                                  } catch (err) {
                                    d = " ";
                                  }
                                  return Container(
                                      margin: EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                        color: Color(0xCCE3E3E3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.6),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(children: [
                                        Image.asset(
                                          "images/studentconcern.png",
                                          height: 120,
                                          width: 120,
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 6),
                                                        child: Text(
                                                          "Issue: ",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),

                                                        )),
                                                    SizedBox(
                                                        width: 160,
                                                        child: Container(
                                                            margin: EdgeInsets.only(
                                                                top: 6),child:Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            document["issue"]
                                                                .toString(),
                                                          style: TextStyle(
                                                            fontSize: 16
                                                          ),

                                                        )))
                                                  ]),
                                                  Row(children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 6),child:
                                                    Text(
                                                      "From: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:16,
                                                      ),
                                                    )),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 6),child:
                                                    Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        document["Fname"]
                                                                .toString() +
                                                            " " +
                                                            document["Lname"]
                                                                .toString(),
                                                    style: TextStyle(
                                                      fontSize: 16
                                                    ),
                                                    ))
                                                  ]),
                                                  Row(children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 6),child:
                                                    Text(
                                                      "Posted on: ",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                      fontSize: 16
                                                      ),
                                                    )),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 6),child:
                                                    Text(d, style: TextStyle(
                                                      fontSize: 16
                                                    ),))
                                                  ]),
                                                  Align(
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 15),
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.0),
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                IssueByStudentPage(
                                                                                  IssueTitle: document['issue'].toString(),
                                                                                )),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .purple,
                                                                    ),
                                                                    child: Text(
                                                                      "Read more...",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )))),
                                                  ),
                                                ]))
                                      ]));
                                }).toList()));
                      }
                    }))
          ]))))),
    );
  }
}
