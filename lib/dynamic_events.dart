// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as fs;
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class EventNew extends StatefulWidget {
  String eventName;

  EventNew({
    Key? key,
    required this.eventName,
  }) : super(key: key);
  @override
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<EventNew> {
  String? gotinfo, gotdeadline, gottitle;
  @override
  void initState() {
    super.initState();
    gottitle = widget.eventName;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0091DE),
        title: Text(
          gottitle!,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => tabsPage(selectedIndex: 0)),
            );
            //Navigator.pop(context);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'btn6',
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
      body: SingleChildScrollView(

        child: SafeArea(
          child: Container(

            child: Column(
              children: [
               Container(child:StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('events')
                        .where("title", isEqualTo: gottitle)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Container(
                            height: MediaQuery.of(context).size.height-80,
                            child: ListView(

                              children: snapshot.data!.docs.map((document) {
                                gotinfo = document["info"];
                                gotdeadline = document['ddline'];

                                return Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),

                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(

                                            // margin: EdgeInsets.all(20.0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 25.0, vertical: 10),

                                            width: 200,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.purple,
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                                            ),
                                            child: Text(
                                              'Event Details',
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        UnconstrainedBox(
                                          child: Container(
                                            height: 60,

                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(20),
                                                    child: Text(
                                                      
                                                          gottitle!,
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          color: Color(0xFF525252),
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                  ),


                                          ),
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
                                                 gotinfo!,
                                                textAlign: TextAlign.justify,
                                                textDirection: TextDirection.ltr,
                                                style: GoogleFonts.lato(
                                                  textStyle:
                                                      TextStyle(fontSize: 15),
                                                  color: Color(0xFF525252),
                                                ),
                                              )),
                                        ),
                                        Container(
                                          child:
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child:Row(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      "Type of the event:  " ,
                                                      style: GoogleFonts.lato(
                                                        color: Colors.purple,
                                                        textStyle: TextStyle(
                                                          color: Colors.purple,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      document['type'],
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          color: Color(0xFF525252),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),

                                                ]
                                            ),


                                          ),
                                          height: 30,
                                        ),
                                        Container(
                                          child:
                                          Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 25.0),
                                              child:Row(
                                                children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,

                                                  child: Text(
                                                    "Date of the event:  " ,
                                                    style: GoogleFonts.lato(
                                                      color: Colors.purple,
                                                      textStyle: TextStyle(
                                                        color: Colors.purple,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),),
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      document["date"],
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          color: Color(0xFF525252),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),

                                                ]
                                                ),


                                          ),
                                          height: 30,
                                        ),
                                        Container(
                                          child:
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child:Row(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      "Registration Deadline:  " ,
                                                      style: GoogleFonts.lato(
                                                        color: Colors.purple,
                                                        textStyle: TextStyle(
                                                          color: Colors.purple,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      gotdeadline!,
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          // color: Color(0xFF525252),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),

                                                ]
                                            ),


                                          ),
                                          height: 30,
                                        ),
                                        Container(
                                          child:
                                          Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child:Row(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: Text(
                                                      "Registration Link:  " ,
                                                      style: GoogleFonts.lato(
                                                        color: Colors.purple,
                                                        textStyle: TextStyle(
                                                          color: Colors.purple,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),),
                                                  Align(
                                                    alignment: Alignment.bottomLeft,

                                                    child: GestureDetector(
                                                      onTap:
                                                      ()async {
                                                        if(await canLaunchUrl(Uri.parse(document['link']))) {
                                                          await launchUrl(Uri.parse(document['link']),mode: LaunchMode.externalApplication);
                                                        } else {
                                                          Fluttertoast.showToast(msg: "Cannot launch the link...",backgroundColor: Colors.red);
                                                        }
                                                      },
                                                      child: Container(
                                                          width: 150,

                                                        child: Text(
                                                          document['link'],
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                              color: Colors.blue,
                                                              decoration: TextDecoration.underline,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),),

                                                ]
                                            ),


                                          ),
                                          height: 30,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                            child: FutureBuilder(  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                                                future: giveDownloadUrl(
                                                    document["img"]),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData == false) {
                                                    return CircularProgressIndicator();
                                                  } else {
                                                    return Image.network(
                                                      snapshot.data.toString(),
                                                      width: 300,
                                                      height: 300,
                                                    );
                                                  }
                                                })),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
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
                    },
                  ),),

                // SizedBox(
                //   height: 200.0,
                //   width: 400.0,
                // ),
                // Container(
                //   // margin: EdgeInsets.all(20.0),
                //   padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                //   color: Color(0xFFFFBA15),
                //   width: 2000,
                //   height: 40,
                //   child: Text(
                //     'Event Details',
                //     style: GoogleFonts.roboto(
                //       textStyle: TextStyle(
                //         fontSize: 15.0,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 25,
                //       ),
                //       child: Text(
                //         'Info:' + gotinfo!,
                //         textAlign: TextAlign.justify,
                //         textDirection: TextDirection.ltr,
                //         style: GoogleFonts.lato(
                //           textStyle: TextStyle(fontSize: 13),
                //           color: Color(0xFF525252),
                //         ),
                //       )),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   child: Row(
                //     children: [
                //       Align(
                //         alignment: Alignment.bottomLeft,
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //           child: Text(
                //             'Programme Name:' + gottitle!,
                //             style: GoogleFonts.lato(
                //               textStyle: TextStyle(
                //                 color: Color(0xFF525252),
                //                 fontSize: 13,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   height: 30,
                // ),
                // Container(
                //   child: Row(
                //     children: [
                //       Align(
                //         alignment: Alignment.bottomLeft,
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //           child: Text(
                //             'Deadline:' + gotdeadline!,
                //             style: GoogleFonts.lato(
                //               textStyle: TextStyle(
                //                 color: Color(0xFF525252),
                //                 fontSize: 13,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   height: 30,
                // ),

                // /*Container(
                //     child: Row(
                //       children: [
                //         Align(
                //           alignment: Alignment.bottomLeft,
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //             child: Text('53', style: GoogleFonts.roboto(textStyle: TextStyle(color: Color(0xFF720972), fontSize: 20, fontWeight: FontWeight.bold))),
                //           ),
                //         ),
                //       ],
                //     ),
                //     height: 25,
                //   ),*/

                // SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   Future _getEventInfo(String? event) async {
//     setState(() async {
//       gottitle = event;
//       print(gottitle);
//       await FirebaseFirestore.instance
//           .collection("events")
//           .where("title", isEqualTo: gottitle)
//           .get()
//           .then((value) {
//         value.docs.forEach((element) {
//           FirebaseFirestore.instance
//               .collection("events")
//               .doc(element.id)
//               .get()
//               .then((value) {
//             gotinfo = element.data()['info'];
//             gotdeadline = element.data()['ddline'];
//             // Access your after your get the data
//           });
//         });
//       });
//     });
//   }
// }
  Future giveDownloadUrl(String x) async {
    fs.Reference storageRef =
        fs.FirebaseStorage.instance.ref().child('events/').child(x);
// no need of the file extension, the name will do fine.
    var url = await storageRef.getDownloadURL();
    print(url);
    return url;
  }
}
