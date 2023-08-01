import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mscapp/dynamic_publishopportunities.dart';
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

class ViewOppur extends StatefulWidget {
  _ViewOppurState createState() => _ViewOppurState();
}

class _ViewOppurState extends State<ViewOppur> {
  bool selectIntern = true;
  bool selectPlment = false;
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
            title: Text('All Opportunities'),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tabsPage(selectedIndex: 0),
                    ));
              },
            ),
          ),
          body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                Row(

                  children: [
                    ElevatedButton(

                        onPressed: () {
                          setState(() {
                            selectIntern = true;
                            selectPlment = false;
                          });
                        },
                        child: Text(
                          "Internships",
                          style: TextStyle(
                            color: !selectIntern ? Colors.purple : Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: !selectIntern ? Colors.white : Colors.purple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.elliptical(10, 40)
                                    //  bottomLeft:, bottom left
                                    // bottomRight: bottom right
                                    )))),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectIntern = false;
                            selectPlment = true;
                          });
                        },
                        child: Text(
                          "Placements",
                          style: TextStyle(
                            color: !selectPlment ? Colors.blue : Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(6),
                            primary: !selectPlment ? Colors.white : Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.elliptical(10, 40)
                                    //  bottomLeft:, bottom left
                                    // bottomRight: bottom right
                                    ))))
                  ],
                ),
                SingleChildScrollView(

                    child: SafeArea(
                        child: Container(
                          padding: EdgeInsets.all(0),
                            child: Column(children: [
                  Container(
                      child: StreamBuilder(
                          stream: selectIntern
                              ? FirebaseFirestore.instance
                                  .collection('Published_Opportunity')
                                  .where("oppo", whereIn:["Internship" ,"Internship with PPO"])
                                  .snapshots()
                              : FirebaseFirestore.instance
                                  .collection('Published_Opportunity')
                                  .where("oppo", isEqualTo: "Placement")
                                  .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container(
                                  color:
                                      !selectIntern ? Colors.blue : Colors.purple,
                                  height:
                                      MediaQuery.of(context).size.height - 148,
                                  child: ListView(
                                      controller: ScrollController(),
                                      children:
                                          snapshot.data!.docs.map((document) {
                                        return Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white),
                                            child: Row(children: [
                                              Image.asset(
                                                "images/event-add.jpg",
                                                height: 120,
                                                width: 120,
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(10,30,0,20),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        
                                                        Row(children: [
                                                          Text(
                                                            "Posted By: ",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),

                                                          Container(
                                                            child: Text(document["Role"]
                                                                .toString(),
                                                            overflow: TextOverflow.ellipsis,),
                                                          )
                                                        ]),
                                                        Row(children: [
                                                          Text(
                                                            "For Department: ",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Container(child:Text(document["dep"]
                                                              .toString(),
                                                          overflow: TextOverflow.ellipsis,
                                                          ))
                                                        ]),
                                                        Row(children: [
                                                          Text(
                                                            "From Company: ",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(document["company"]
                                                              .toString())
                                                        ]),
                                                        Align(
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      bottom:
                                                                          10.0),
                                                              child: Text(document[
                                                                      "date"]
                                                                  .toString())),
                                                        ),
                                                        Align(
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
                                                                            .pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) =>
                                                                                  OppNew(
                                                                                    eventName: document["dep"].toString(),
                                                                                  )),
                                                                        );
                                                                      },
                                                                      child: Text(
                                                                          "See more"))),
                                                        )
                                                      ]))
                                            ]));
                                      }).toList()));
                            }
                          }))
                ]))))
              ]))),
    );
  }
}
