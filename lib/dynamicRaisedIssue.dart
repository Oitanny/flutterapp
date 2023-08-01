import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mscapp/options.dart';
import 'package:mscapp/studentIssues.dart';
import 'home.dart';
import 'tabsPage.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as Path;

class IssueByStudentPage extends StatefulWidget {
  String IssueTitle;

  IssueByStudentPage({
    Key? key,
    required this.IssueTitle,
  }) : super(key: key);
  @override
  IssueByStudentMain createState() {
    return IssueByStudentMain();
  }
}

class IssueByStudentMain extends State<IssueByStudentPage> {
  String d=" ";
  String? issue;
  @override
  void initState() {
    super.initState();
    issue = widget.IssueTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text('Issue by Student'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => RaisedStudentIssues(),
              ),
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
              child: SafeArea(
                  child: Container(
                      child: Column(children: [
            Container(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('raised_issues')
                        .where("issue", isEqualTo: issue)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView(
                              controller: ScrollController(),
                              children: snapshot.data!.docs.map((document) {
                                try {
                                  d = document["date"].toString();
                                } catch (err) {
                                  d = " ";
                                }
                                return Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Color(0xBEC4B5DC),
                                        padding: EdgeInsets.all(2),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                            'images/alertIssue.jpg',
                                            height: 170),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                            ),
                                            child: Text(
                                              document['issue'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25.0),
                                                child: Container(
                                                    child: Text('Raised By:',
                                                        style: TextStyle(
                                                            fontSize: 18))),
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Container(
                                                    child: Text(
                                                  document['Fname'] +
                                                      " " +
                                                      document["Lname"],
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )))
                                          ],
                                        ),
                                        height: 30,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25.0),
                                                child: Text(
                                                  'Email:',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                document['email'],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        height: 30,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25.0),
                                                child: Text(
                                                  'Date Raised on:',
                                                  style:
                                                  TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                d,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        height: 30,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 25.0),
                                                child: Text(
                                                  'Description:',
                                                  style:
                                                  TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                document['wissue'],
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        height: 30,
                                      ),

                                      /*Container(
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text('53', style: GoogleFonts.roboto(textStyle: TextStyle(color: Color(0xFF720972), fontSize: 20, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ],
                    ),
                    height: 25,
                  ),*/

                                      SizedBox(height: 10),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ));
                      }
                    }))
          ])))),
        ));
  }
}
