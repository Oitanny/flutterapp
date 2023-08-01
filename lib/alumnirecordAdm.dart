import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'options.dart';

void main() => runApp(AlumniRecord());

class AlumniRecord extends StatefulWidget {
  _AlumniRecordState createState() => _AlumniRecordState();
}

class _AlumniRecordState extends State<AlumniRecord> {
  int? _value = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CollectionReference alumni = FirebaseFirestore.instance.collection("alumni");
  TextEditingController fname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alumni Records'),
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
        body:  Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 1,
    child:SingleChildScrollView(
        controller: ScrollController(),
            child: SafeArea(
                child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height-85,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('alumni')
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
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((document) {
                                // print( document['Fname'] +
                                //     " \n" +
                                //     document["Lname"]+"\n"+
                                //   document[
                                // 'company']+"\n"+document[
                                // 'course']+"\n"+document[
                                // 'currentlyp']+"\n"+document[
                                // 'des']
                                // );
                                return Container(

                                  child: Column(
                                    children: [
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
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Company : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'company'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Course : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                              'course'] +
                                                                          " " ,
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Salary : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'currentlyp'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    ))
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Department : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'depart'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Designation : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'des'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Description  : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'description'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 4.0,
                                                                    left: 12.0,
                                                                    bottom: 8.0,
                                                                    right:
                                                                        12.0),
                                                            child: Row(
                                                                children: [
                                                                  Text(
                                                                    "Email id : ",
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: GoogleFonts.lato(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                            Flexible(child:
                                                                  Text(
                                                                    document[
                                                                        'email'],
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .justify,
                                                                    style: GoogleFonts.lato(
                                                                        color: Colors
                                                                            .black87),
                                                                  )),
                                                                ]),
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0,
                                                                      left:
                                                                          12.0,
                                                                      bottom:
                                                                          8.0,
                                                                      right:
                                                                          12.0),
                                                              child: Row(
                                                                  children: [
                                                                    Text(
                                                                      "Phone number : ",
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                              Flexible(child:
                                                                    Text(
                                                                      document[
                                                                          'phn'],
                                                                      maxLines:
                                                                          3,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .justify,
                                                                      style: GoogleFonts.lato(
                                                                          color:
                                                                              Colors.black87),
                                                                    )),
                                                                  ])),
                                                        ])),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
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
                                                                return Image
                                                                    .asset(
                                                                  'images/alumni_noimg.jpg',
                                                                  width: 100,
                                                                  height: 100,
                                                                );
                                                              } else {
                                                                return Container(
                                                                  child: Image.network(
                                                                      snapshot
                                                                          .data
                                                                          .toString(),
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          150),
                                                                );
                                                              }
                                                            })),
                                                  ])

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
                                              //           TextAlign.justify,
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ));
                      }
                    })),
          SizedBox(height: 20,)],
        )))));
  }

  Future giveDownloadUrl(String x) async {
    fs.Reference storageRef =
        fs.FirebaseStorage.instance.ref().child('alumni/').child(x);
// no need of the file extension, the name will do fine.
    var url = await storageRef.getDownloadURL();
    print(url);
    return url;
  }
}
