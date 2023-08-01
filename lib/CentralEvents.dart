
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/event_highlights.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

// This widget is the root of your application.
@override
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "College Central Events",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: !isSearching
                ? Text("College Central Events")
                : TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ))),
            // actions: <Widget>[
            //   isSearching
            //       ? IconButton(
            //           icon: Icon(Icons.cancel),
            //           onPressed: () {
            //             setState(() {
            //               this.isSearching = false;
            //             });
            //           },
            //         )
            //       : IconButton(
            //           icon: Icon(Icons.search),
            //           onPressed: () {
            //             setState(() {
            //               this.isSearching = true;
            //             });
            //           },
            //         )
            // ],
            // leading: IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () {},
            // ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'images/clg1.png',
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1300,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                            Card(
                              elevation: 0.0,
                              color: Color(0xFFF1F2F2),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://mscw.ac.in/resources/img/gallery/councilday/un1.JPG',
                                        width: 160,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      'Annual Sport Day',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Card(
                              elevation: 0.0,
                              color: Color(0xFFF1F2F2),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'images/clg2.png',
                                        width: 160,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      'Technoserve',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Card(
                              elevation: 0.0,
                              color: Color(0xFFF1F2F2),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://mscw.ac.in/resources/img/media/media23.jpeg',
                                        width: 160,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      'Saarang',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Card(
                              elevation: 0.0,
                              color: Color(0xFFF1F2F2),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'https://mscw.ac.in/resources/img/gallery/saarang/s9.JPG',
                                        width: 160,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      'Annual Day',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Card(
                              elevation: 0.0,
                              color: Color(0xFFF1F2F2),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 16, left: 10, right: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'images/clg3.png',
                                        width: 160,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: Text(
                                      'Orientation',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text('Upcoming events',
                                style: TextStyle(
                                  color: Color(0xFF720972),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                      //Expanded(
                      //   child:
                      SingleChildScrollView(
                          child: SafeArea(
                              child: Container(
                                  child: Column(children: [
                        Container(
                            child: StreamBuilder(
                                stream: // selectIntern
                                    // ?
                                    FirebaseFirestore.instance
                                        .collection('events')
                                        .where("type",
                                            isEqualTo: "Central Event")
                                        .snapshots(),
                                //: FirebaseFirestore.instance
                                //  .collection('Published_Opportunity')
                                //  .where("oppo", isEqualTo: "Placement")
                                //  .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    return Container(
                                        //  color:
                                        // !selectIntern ? Colors.blue : Colors.purple,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: ListView(
                                            controller: ScrollController(),
                                            children: snapshot.data!.docs
                                                .map((document) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    // Padding(
                                                    //   padding: EdgeInsets.only(
                                                    //       top: 16,
                                                    //       left: 16,
                                                    //       right: 5),
                                                    //  child:
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 16,
                                                          left: 16,
                                                          right: 5),
                                                      child: Container(
                                                          // margin:
                                                          //     EdgeInsets.all(10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF1F2F2),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top: 12.0,
                                                                    left: 12.0,
                                                                    bottom: 4.0,
                                                                    right:
                                                                        12.0),
                                                                // Row(
                                                                // children: [
                                                                child: Text(
                                                                  (document[
                                                                          "title"]
                                                                      .toString()),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .justify,
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                              0xFF455A64)
                                                                          .withOpacity(
                                                                              1.0),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),

                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0,
                                                                        bottom:
                                                                            8.0,
                                                                        right:
                                                                            12.0,
                                                                        left:
                                                                            12),
                                                                child:
                                                                      Text(
                                                                        (document["info"]
                                                                            .toString()),
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts.lato(
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      /* Image.asset(
                        'image/campus.png',
                        width: 85,
                        height: 100,
                        fit: BoxFit.cover,
                      ),*/

                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0,
                                                                        bottom:
                                                                            8.0,
                                                                        right:
                                                                            12.0,
                                                                        left:
                                                                            12),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        " Last Date To Register: ",
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      Text(document[
                                                                              "ddline"]
                                                                          .toString())
                                                                      //  Container(
                                                                      //   child: const Padding(padding: EdgeInsets.all(4.0),
                                                                      //   child: Text(
                                                                      //     "Last Date To Register::",
                                                                      //     textAlign:
                                                                      //       TextAlign
                                                                      //           .justify,
                                                                      //   style: TextStyle(
                                                                      //       color: Color.fromARGB(255, 0, 8, 12)),

                                                                      //   ),
                                                                      //  ),),
                                                                      //  Container(
                                                                      //   child: const Padding(padding: EdgeInsets.all(4.0),
                                                                      //   child: Text(
                                                                      //   (document[
                                                                      //           "title"]
                                                                      //       .toString()),
                                                                      //     textAlign:
                                                                      //       TextAlign
                                                                      //           .justify,
                                                                      //   style: TextStyle(
                                                                      //       color: Color.fromARGB(255, 10, 10, 10)),

                                                                      //   ),
                                                                      //  ),
                                                                      //  )
                                                                    ]),
                                                              ),
                                                              Padding(
                                                                //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7.0),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            7,
                                                                  horizontal: 16
                                                                ),
                                                                child:
                                                                    ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                        primary:Colors.green
                                                                      ),
                                                                  onPressed:()async {
                                                                    if(await canLaunchUrl(Uri.parse(document['link']))) {
                                                                      await launchUrl(Uri.parse(document['link']),mode: LaunchMode.externalApplication);
                                                                    } else {
                                                                      Fluttertoast.showToast(msg: "Cannot launch the link...",backgroundColor: Colors.red);
                                                                    }
                                                                  },
                                                                  // color: Color(0XFF04C300),
                                                                  // shape: RoundedRectangleBorder(
                                                                  //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                                  // ),
                                                                  child: Text(
                                                                    "Register Now",
                                                                    style:
                                                                        TextStyle(

                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),

                                                              // ],
                                                              // )
                                                              // Padding(
                                                              //   padding: const EdgeInsets
                                                              //           .only(
                                                              //       top: 12.0,
                                                              //       left: 12.0,
                                                              //       bottom: 4.0,
                                                              //       right:
                                                              //           12.0),
                                                              //   child: Text(
                                                              //     (document[
                                                              //             "title"]
                                                              //         .toString()),
                                                              //     textAlign:
                                                              //         TextAlign
                                                              //             .justify,
                                                              //     style: TextStyle(
                                                              //         color: Color(
                                                              //             0xFF455A64),
                                                              //         fontWeight:
                                                              //             FontWeight
                                                              //                 .bold),
                                                              //   ),
                                                              // ),
                                                              /* Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0,
                                                                        bottom:
                                                                            8.0,
                                                                        right:
                                                                            12.0,
                                                                        left:
                                                                            12),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: <
                                                                        Widget>[
                                                                      Text(
                                                                        (document["info"]
                                                                            .toString()),
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts.lato(
                                                                            color:
                                                                                Colors.black87),
                                                                      ),
                                                                      /* Image.asset(
                        'image/campus.png',
                        width: 85,
                        height: 100,
                        fit: BoxFit.cover,
                      ),*/
                                                                    ]),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0,
                                                                        bottom:
                                                                            8.0,
                                                                        right:
                                                                            12.0,
                                                                        left:
                                                                            12),
                                                                child:
                                                                    new InkWell(
                                                                  child: new Text(
                                                                      'Read me'),
                                                                  onTap: () =>
                                                                      launch(
                                                                          "https://mscw.ac.in/aboutus.aspx"),
                                                                ),
                                                              ),
                                                              Padding(
                                                                //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7.0),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            18,
                                                                        horizontal:
                                                                            50),
                                                                child:
                                                                    ElevatedButton(
                                                                  onPressed:
                                                                      _launchURL,
                                                                  // color: Color(0XFF04C300),
                                                                  // shape: RoundedRectangleBorder(
                                                                  //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                                  // ),
                                                                  child: Text(
                                                                    "Register Now",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),*/
                                                            ],
                                                          )),
                                                    ),
                                                    // ),
                                                  ],
                                                ),
                                              );
                                            }).toList()));
                                  }
                                })),
                      ]))))
                      /* controller: ScrollController(),
                              child: Column(children: [
                                /*addEvent(
                                    "Orientation",
                                    "Students who are new to the University of Denver \nwill need to complete the Immigration Check \nIn. NOTE that this process cannot be completed\n until AFTER you arrive in the United States.",
                                    "https://mscw.ac.in/aboutus.aspx"),
                                addEvent(
                                    "Annual Sports Day",
                                    "Mata Sundri College for Women is an institution\n where we strive to achieve excellence in \nhigher education and women empowerment. ",
                                    "https://mscw.ac.in/aboutus.aspx"),
                                addEvent(
                                    "Sarang",
                                    "Students who are new to the University of Denver \nwill need to complete the Immigration Check \nIn. NOTE that this process cannot be completed\n until AFTER you arrive in the United States.",
                                    "https://mscw.ac.in/aboutus.aspx"),
                                addEvent(
                                    "Orientation",
                                    "Students who are new to the University of Denver \nwill need to complete the Immigration Check \nIn. NOTE that this process cannot be completed\n until AFTER you arrive in the United States.",
                                    "https://mscw.ac.in/aboutus.aspx"),
                                addEvent(
                                    "Orientation",
                                    "Students who are new to the University of Denver \nwill need to complete the Immigration Check \nIn. NOTE that this process cannot be completed\n until AFTER you arrive in the United States.",
                                    "https://mscw.ac.in/aboutus.aspx"),*/
                                Container(
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('events')
                                            // .where("title", isEqualTo: "xyz")
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          print('Connection');
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            return Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                child: ListView(
                                                  controller:
                                                      ScrollController(),
                                                  children: snapshot.data!.docs
                                                      .map((document) {
                                                    return Container(
                                                      child: Column(
                                                        children: [
                                                          /*if (document[
                                                                  'type'] ==
                                                              'CentralEvent')
                                                            addEvent(
                                                                document[
                                                                    'title'],
                                                                document[
                                                                    'info'],
                                                                "https://mscw.ac.in/aboutus.aspx")*/

                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 16,
                                                                    left: 16,
                                                                    right: 5),
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF1F2F2),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0)),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              12.0,
                                                                          left:
                                                                              12.0,
                                                                          bottom:
                                                                              4.0,
                                                                          right:
                                                                              12.0),
                                                                      child:
                                                                          Text(
                                                                        document['title']
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.justify,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFF455A64),
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              4.0,
                                                                          bottom:
                                                                              8.0,
                                                                          right:
                                                                              12.0,
                                                                          left:
                                                                              12),
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment
                                                                              .spaceEvenly,
                                                                          children: <
                                                                              Widget>[
                                                                            Text(
                                                                              document['info'].toString(),
                                                                              maxLines: 3,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: GoogleFonts.lato(color: Colors.black87),
                                                                            ),
                                                                            /* Image.asset(
                        'image/campus.png',
                        width: 85,
                        height: 100,
                        fit: BoxFit.cover,
                      ),*/
                                                                          ]),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              4.0,
                                                                          bottom:
                                                                              8.0,
                                                                          right:
                                                                              12.0,
                                                                          left:
                                                                              12),
                                                                      child:
                                                                          new InkWell(
                                                                        child: new Text(
                                                                            'Read me'),
                                                                        onTap: () =>
                                                                            launch("https://mscw.ac.in/aboutus.aspx"),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7.0),
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              18,
                                                                          horizontal:
                                                                              50),
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            _launchURL,
                                                                        // color: Color(0XFF04C300),
                                                                        // shape: RoundedRectangleBorder(
                                                                        //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                                                        // ),
                                                                        child:
                                                                            Text(
                                                                          "Register Now",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                13.0,
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                ));
                                          }
                                        }))
                              ]))
                              */
                      // )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

/*class addEvent extends StatelessWidget {
  String content;
  String Url;
  String read = "";
  String heading;
  addEvent(this.heading, this.content, this.Url);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 5),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F2F2),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                      child: Text(
                        heading,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Color(0xFF455A64),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 8.0, right: 12.0, left: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.lato(color: Colors.black87),
                            ),
                            /* Image.asset(
                        'image/campus.png',
                        width: 85,
                        height: 100,
                        fit: BoxFit.cover,
                      ),*/
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 8.0, right: 12.0, left: 12),
                      child: new InkWell(
                        child: new Text('Read me'),
                        onTap: () => launch(Url),
                      ),
                    ),
                    Padding(
                      //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                      child: ElevatedButton(
                        onPressed: _launchURL,
                        // color: Color(0XFF04C300),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        // ),
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}*/

_launchURL() async {
  const url =
      'https://docs.google.com/forms/d/e/1FAIpQLSfo8S2EKpNxXRhb4OmfULLTHZHF3rdSUhbtlBy6fdaRuX59Lg/viewform';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
