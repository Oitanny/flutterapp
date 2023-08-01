import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/dynamic_events.dart';
import 'sideMenu.dart';
import 'button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'event1.dart';
import 'event2.dart';
import 'CentralEvents.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'DepartmentalEvents.dart';

class EventH extends StatefulWidget {
  _EventHState createState() => _EventHState();
}
List<String> allEvents=[];

class _EventHState extends State<EventH> {
  final pageViewController = PageController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Events");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: cusIcon,
        //     onPressed: () {
        //       {
        //         showSearch(
        //             context: context,
        //             // delegate to cu
        //             stomize the search bar
        //             delegate: Search());
        //       }
        //     },
        //   )
        // ],
      title: cusSearchBar,
        backgroundColor: Color(0xFF0091DE),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn5',
          onPressed: () async {
            if(await canLaunchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
              await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),mode: LaunchMode.externalApplication);
            } else {
              Fluttertoast.showToast(msg: "Launch Application not found");
            }
          },
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/chatbot.jpg'), fit: BoxFit.fill),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFFFFF),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageViewController,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNHj6bYl76vYBHtWJpXFrHYEDk6u_J3ZAXw&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNHj6bYl76vYBHtWJpXFrHYEDk6u_J3ZAXw&usqp=CAU',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://mscw.ac.in/events/gal/DSC_0601.JPG',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://mscw.ac.in/events/gal/DSC_0096.JPG',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://mscw.ac.in/events/gal/DSC_9149.JPG',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://mscw.ac.in/events/gal/DSC_0363.JPG',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          hintText: 'Search Events',
                          hintStyle: TextStyle(
                            color: Color(0xFF525252),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  color: Color(0xFFFFBA15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Central Societies Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new InkWell(
                          child: new Text('More'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: ScrollController(),
                child: Column(

                  children: [
                    // addEvent(context),
                    // addEvent1(context),
                    // addEvent2(),
                    // addEvent3(),
                    // addEvent4(),
                    Container(
                      height: 115,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('events').where("type",
                            isEqualTo: "Central Event")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                                child:GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                    childAspectRatio: 2.5,
                                    controller: ScrollController(),
                                    children:
                                    snapshot.data!.docs.map((document) {
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                    EventNew(
                                                      eventName:
                                                      document['title'].toString(),
                                                    )),
                                          );
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.all(10),
                                            child:Center(child:Text(
                                            document['title'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,

                                            ),
                                            )),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                              color: Color(0xFF720972),
                                          ),



                                           ),
                                      );

                                    }).toList(),
                                  ),
                                );

                          }
                        },

                      ),
                    ),

                  ],
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         new Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             Container(
              //               height: 50,
              //               width: 160,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(5.0),
              //                 color: Color(0xFF720972),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: new InkWell(
              //                   child: new Text(
              //                     '     Peer Mentorship \n    program',
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   onTap: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => Event1()));
              //                   },
              //                 ),
              //               ),
              //             ),
              //             Container(
              //               height: 50,
              //               width: 160,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(5.0),
              //                 color: Color(0xFF720972),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: new InkWell(
              //                   child: new Text(
              //                     '    Un-Lock benefits of \n    LinkedIn',
              //                     style: TextStyle(color: Colors.white),
              //                   ),
              //                   onTap: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => Event2()));
              //                   },
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           width: double.infinity,
              //           height: 12.0,
              //         ),
              //         new Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             customButton(
              //                 'Pride makeup\nCompetition', Color(0xFF720972),
              //                     () {
              //                   navigate(context, 'event1');
              //                 }),
              //             customButton(
              //                 'Behavioral Biometric', Color(0xFF720972), () {
              //               navigate(context, 'event2');
              //             }),
              //           ],
              //         ),
              //         SizedBox(
              //           width: double.infinity,
              //           height: 12.0,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  color: Color(0xFFFFBA15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Departmental Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new InkWell(
                          child: new Text('More'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  DepartmentalEvent()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                controller: ScrollController(),
                child: Column(

                  children: [
                    // addEvent(context),
                    // addEvent1(context),
                    // addEvent2(),
                    // addEvent3(),
                    // addEvent4(),
                    Container(
                      height: 130,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('events').where("type",
                            isEqualTo: "Departmental Event")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container(
                              height: 115,
                              child:GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 2.7,
                                controller: ScrollController(),
                                children:
                                snapshot.data!.docs.map((document) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                EventNew(
                                                  eventName:
                                                  document['title'].toString(),
                                                )),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      child:Center(child:Text(
                                        document['title'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,

                                        ),
                                      )),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Color(0xFF720972),
                                      ),



                                    ),
                                  );

                                }).toList(),
                              ),
                            );

                          }
                        },

                      ),
                    ),

                  ],
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         new Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             customButton('Meme Fest', Color(0xFF720972), () {
              //               navigate(context, 'event1');
              //             }),
              //             customButton('Fit India Movement', Color(0xFF720972),
              //                     () {
              //                   navigate(context, 'event2');
              //                 }),
              //           ],
              //         ),
              //         SizedBox(
              //           width: double.infinity,
              //           height: 12.0,
              //         ),
              //         new Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             customButton(
              //                 'International \nYoga Day', Color(0xFF720972),
              //                     () {
              //                   navigate(context, 'event1');
              //                 }),
              //             customButton(
              //                 'Tree for the \nFuture', Color(0xFF720972), () {
              //               navigate(context, 'event2');
              //             }),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  String got = "";
  // final eventsinclg = [
  //   "Peer mentorship programme",
  //   "Un-lock benefits of LinkedIn",
  //   "Financial wellness",
  //   "Success through teamwork",
  //   "Reboot",
  //   "Webinar on mental health",
  //   "TEDx event",
  // ];
  final eventsinclg=allEvents;
  List<String> recentsrch =allEvents.sublist(0,allEvents.length>5?4:allEvents.length);

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ]; //removes anything registered within the search bar
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on app bar on left side
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: (MediaQuery.of(context).size.width) - 20, //screen width -20
      child: Card(

          color: Colors.blue,
          child: ElevatedButton(
              onPressed: () {
                addToRecentSearch(got);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder:
                          (context) =>
                          EventNew(
                            eventName:
                            got,
                          )),
                );
              },
              child: Center(
                child: Text(got),
              ))),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show relevant things when someone searches
    //-->query is a property that represents entered text by user
    final suggestionList = query.isEmpty
        ? recentsrch
        : allEvents
        .where((str) => str.toLowerCase().startsWith(query.toLowerCase()))
        .toList(growable: false);
    print(">>>>>>>>>>>>>>>>>>>>>>");
    print(suggestionList);
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        //what happens when we click suggested search
          onTap: () {
            got = suggestionList[index];
            showResults(context);
          },
          leading: Icon(Icons.arrow_right),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.normal))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
  void addToRecentSearch(x){
    if(recentsrch.length==5){
      recentsrch[4]=x;
    }
    else{
      recentsrch.add(x);
    }
    print(recentsrch);
  }
}
