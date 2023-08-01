import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/tabsPage.dart';

import 'dynamic_events.dart';
import 'home.dart';
import 'options.dart';

void main() => runApp(NAlumniRecord());

class NAlumniRecord extends StatefulWidget {
  _NAlumniRecordState createState() => _NAlumniRecordState();
}

class _NAlumniRecordState extends State<NAlumniRecord> {
  int? _value = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notable Alumni'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => tabsPage(selectedIndex: 0),
              ),
            ),
          ),
        ),
        body:  SafeArea(
        child: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height, child:Column(
      children: [
        Expanded(
              child: SingleChildScrollView(

                    child: Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height-90,
                         child:
                         StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Nalumni1')
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
                                            return  Column(children: [
                                                  Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Container(
                                                        padding: EdgeInsets.all(8.0),
                                                        width:
                                                        MediaQuery.of(context).size.width,
                                                        decoration: BoxDecoration(
                                                          color: Color.fromARGB(
                                                              255, 219, 219, 219),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(10.0)),
                                                        ),
                                                        child: Column(

                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [

                                                              Padding(

                                                                padding: EdgeInsets.all(8.0),
                                                                child: Container(
                                                                  width: MediaQuery.of(context)
                                                                      .size
                                                                      .width,
                                                                  color: Color.fromARGB(
                                                                      255, 175, 93, 175),
                                                                  child: Padding(
                                                                    padding:
                                                                    const EdgeInsets.all(
                                                                        10.0),
                                                                    child: Text(
                                                                      document['Fname'] +
                                                                          " " +
                                                                          document["Lname"],
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                      style: TextStyle(
                                                                          color: Colors.white,
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          letterSpacing: 2),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Expanded(child:
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                              top: 4.0,
                                                                              left: 12.0,
                                                                              bottom: 8.0,
                                                                              right: 12.0),
                                                                          child:Row(children: [
                                                                            Text(
                                                                              "Department : ",
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                            Flexible(child:
                                                                            Text(
                                                                              document[
                                                                              'course'],
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87),
                                                                            )),
                                                                          ])),
                                                                      Padding(
                                                                          padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                              top: 4.0,
                                                                              left: 12.0,
                                                                              bottom: 8.0,
                                                                              right: 12.0),
                                                                          child: Row(children: [
                                                                            Text(
                                                                              "Current Organisation : ",
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),
                                                                            ),
                                                                               Flexible(child:

                                                                            Text(
                                                                              document[
                                                                              'company'],
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts
                                                                                  .lato(
                                                                                color: Colors
                                                                                    .black87,
                                                                              ),
                                                                            ))
                                                                          ])),

                                                                      // Padding(
                                                                      //   padding:
                                                                      //       const EdgeInsets.only(
                                                                      //           top: 4.0,
                                                                      //           left: 12.0,
                                                                      //           bottom: 8.0,
                                                                      //           right: 12.0),
                                                                      //   child: Text(
                                                                      //     "Salary : "+document['currentlyp'],
                                                                      //     maxLines: 3,
                                                                      //     overflow: TextOverflow
                                                                      //         .ellipsis,
                                                                      //     textAlign:
                                                                      //         TextAlign.left,
                                                                      //     style: GoogleFonts.lato(
                                                                      //         color:
                                                                      //             Colors.black87),
                                                                      //   ),
                                                                      // ),

                                                                      Padding(
                                                                          padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                              top: 4.0,
                                                                              left: 12.0,
                                                                              bottom: 8.0,
                                                                              right: 12.0),
                                                                          child: Row(children: [

                                                                            Text(

                                                                              "Designation : ",
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),

                                                                            ),
                                                                            Flexible(child:
                                                                            Text(
                                                                              document['des'],
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87),
                                                                            ))
                                                                          ])),
                                                                      Padding(
                                                                          padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                              top: 4.0,
                                                                              left: 12.0,
                                                                              bottom: 8.0,
                                                                              right: 12.0),
                                                                          child: Row(children: [

                                                                            Text(

                                                                              "CTC : ",
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87,
                                                                                  fontWeight:
                                                                                  FontWeight
                                                                                      .bold),

                                                                            ),
                                                                            Flexible(child:
                                                                            Text(
                                                                              document['currslry'],
                                                                              maxLines: 3,
                                                                              overflow:
                                                                              TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                              TextAlign
                                                                                  .left,
                                                                              style: GoogleFonts.lato(
                                                                                  color: Colors
                                                                                      .black87),
                                                                            ))
                                                                          ])),
                                                                      // Padding(
                                                                      //     padding:
                                                                      //     const EdgeInsets
                                                                      //         .only(
                                                                      //         top: 4.0,
                                                                      //         left: 12.0,
                                                                      //         bottom: 8.0,
                                                                      //         right: 12.0),
                                                                      //     child:Row(children: [
                                                                      //       Text(
                                                                      //         "Email id : ",
                                                                      //         maxLines: 3,
                                                                      //         overflow:
                                                                      //         TextOverflow
                                                                      //             .ellipsis,
                                                                      //         textAlign:
                                                                      //         TextAlign
                                                                      //             .left,
                                                                      //         style: GoogleFonts.lato(
                                                                      //             color: Colors
                                                                      //                 .black87,
                                                                      //             fontWeight:
                                                                      //             FontWeight
                                                                      //                 .bold),
                                                                      //       ),
                                                                      //       Flexible(child:
                                                                      //       Text(
                                                                      //         document['email'],
                                                                      //         maxLines: 3,
                                                                      //         overflow:
                                                                      //         TextOverflow
                                                                      //             .ellipsis,
                                                                      //         textAlign:
                                                                      //         TextAlign
                                                                      //             .left,
                                                                      //         style: GoogleFonts.lato(
                                                                      //             color: Colors
                                                                      //                 .black87),
                                                                      //       )),
                                                                      //     ])),

                                                                      // Padding(
                                                                      //   padding:
                                                                      //       const EdgeInsets.only(
                                                                      //           top: 4.0,
                                                                      //           left: 12.0,
                                                                      //           bottom: 12.0,
                                                                      //           right: 12.0),
                                                                      //   child: GestureDetector(
                                                                      //     onTap: () {
                                                                      //       print(document[
                                                                      //           'email']);
                                                                      //       Navigator.push(
                                                                      //         context,
                                                                      //         MaterialPageRoute(
                                                                      //             builder:
                                                                      //                 (context) =>
                                                                      //                     EventNew(
                                                                      //                       eventName:
                                                                      //                           document['email'].toString(),
                                                                      //                     )),
                                                                      //       );
                                                                      //     },
                                                                      //     child: Text(
                                                                      //       "Read More",
                                                                      //       textAlign:
                                                                      //           TextAlign.left,
                                                                      //       style: TextStyle(
                                                                      //           color: Color(
                                                                      //               0xFF0091DE),
                                                                      //           fontWeight:
                                                                      //               FontWeight
                                                                      //                   .bold,
                                                                      //           decoration:
                                                                      //               TextDecoration
                                                                      //                   .underline),

                                                                      //     )

                                                                      //   ),
                                                                      // ),
                                                                    ],
                                                                  )),

                                                                  Container(
                                                                      padding: EdgeInsets.only(
                                                                          right: 10),
                                                                      child: FutureBuilder(
                                                                        //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                                                          future:
                                                                          giveDownloadUrl(
                                                                              document[
                                                                              'img']),
                                                                          builder: (context,
                                                                              snapshot) {
                                                                            if (snapshot
                                                                                .hasData ==
                                                                                false) {
                                                                              return CircularProgressIndicator();
                                                                            } else {
                                                                              return Container(
                                                                                  child:
                                                                                  CircleAvatar(
                                                                                    backgroundImage:
                                                                                    NetworkImage(
                                                                                      snapshot.data
                                                                                          .toString(),
                                                                                    ),
                                                                                    radius: 55.0,
                                                                                  ));
                                                                            }
                                                                          })),
                                                                ],
                                                              ),
                                                            ]),
                                                      ))
                                                ]);
                                          }).toList(),
                                        ));
                                  }
                                }),
                          ),
                    ]),
              ),
        ),
      ],
    ))));
  }

  Future giveDownloadUrl(String x) async {
    fs.Reference storageRef =
    fs.FirebaseStorage.instance.ref().child('Nalumni/').child(x);
// no need of the file extension, the name will do fine.
    var url = await storageRef.getDownloadURL();
    print(url);
    return url;
  }
}
