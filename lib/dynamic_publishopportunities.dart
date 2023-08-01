 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/viewopportunity.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tabsPage.dart';
 import 'package:fluttertoast/fluttertoast.dart';
 import 'package:url_launcher/url_launcher.dart';

class OppNew extends StatefulWidget {
  String eventName;

  OppNew({
    Key? key,
    required this.eventName,
  }) : super(key: key);
  @override
  _Opp1State createState() => _Opp1State();
}

class _Opp1State extends State<OppNew> {
  String? gotcri, gotrole, gotdep;
  @override
  void initState() {
    super.initState();
    gotdep = widget.eventName;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ViewOppur()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0091DE),
          title: Text(
            "Opportunities for " + gotdep!+" Department",
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
                    builder: (context) => ViewOppur()),
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
                  Container(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Published_Opportunity')
                          .where("dep", isEqualTo: gotdep)
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
                                  gotcri = document["criteria"];
                                  gotrole = document['Role'];
                                  return Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.all(20.0),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 10),
                                          color: Color(0xFF6F3096),
                                          width: 2000,
                                          height: 40,
                                          child: Text(
                                            'Opportunity Details ',
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
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
                                                document['company'],
                                                textAlign: TextAlign.justify,
                                                textDirection: TextDirection.ltr,
                                                style: GoogleFonts.lato(
                                                  textStyle:
                                                      TextStyle(fontSize: 15),
                                                  color: Colors.black,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
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
                                                  child: Text(
                                  "Criteria : " + gotcri!,
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                  child: Text(
                                                    "Profiles offered : " + document['profiles'],
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                  child: Text(
                                                    'Programme Name: ' +
                                                        gotdep!,
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                  child: Text(
                                                    'Posted by: ' + gotrole!,
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                  child: Text(
                                                    "Type of Opportunity : " +
                                                        document["oppo"],
                                                    style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
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
                                        Container(
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 25.0),
                                                  child: Text('Job Profile :',
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color: Color(0xFF861e3f),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                ),
                                              ),
                                            ],
                                          ),
                                          height: 40,
                                        ),
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
                    ),
                  ),
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
}