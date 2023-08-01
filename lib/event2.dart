import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tabsPage.dart';

class Event2 extends StatefulWidget {
  _Event2State createState() => _Event2State();
}

class _Event2State extends State<Event2> {
  _launchURL() async {
    const url =
        'https://docs.google.com/document/d/18Emx4Kkv0ozfUeP2XIObx2-ga4cmyq6G/edit?usp=sharing&ouid=100171023137613986932&rtpof=true&sd=true';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0091DE),
        title: Text(
          'Un-Lock Benefits of LinkedIn',
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
                  builder: (context) => tabsPage(selectedIndex: 2)),
            );
            //Navigator.pop(context);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'btn7',
      //     onPressed: () async {
      //       if(await canLaunchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
      //         await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),mode: LaunchMode.externalApplication);
      //       } else {
      //         Fluttertoast.showToast(msg: "Launch Application not found");
      //       }
      //     },
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
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage('images/event1.jpeg'),
                      width: 400,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  // margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  color: Color(0xFFFFBA15),
                  width: 2000,
                  height: 40,
                  child: Text(
                    'Event Details',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 18.0,
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
                        'The speakers focused on important aspects of LinkedIn including Profile Building & Optimisation, how to set your objective and know your target audience, Professional Networking, Content Creation & Engagement, Search jobs via LinkedIn, Skills and Endorsements. Also through some LinkedIn profiles, Mr. Priyank explained about features of LinkedIn, how we can find news updates from our connections, groups, and different companies, steps to follow for messaging, do’s and don’ts for content, tools to use, etc. He ended the session by sharing few important tips and answering the queries of students.In conclusion, LinkedIn has evolved into a much more robust tool that can and should be used for so much and inculcate the habit of being professional which will help every student in the world outside of college. The session witnessed an enthusiastic participation and all the queries were answered by the speakers. The vote of thanks was delivered by Ms. Parnika Harjai. The success of the session was applauded by Dr. S. Kalpana Devi, Convener, Ms. Ashema Hasti, Co-Convener of the Placement Cell and Ms Harshmeeta Soni, Faculty Member of Mata Sundri College for Women.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 12),
                        ),
                      )),
                ),
                Container(
                    child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('REGISTRATION CLOSED',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                )),
                          )),
                    ),
                  ],
                )),
                Container(
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text('Event Glimpses',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: Color(0xFF720972),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                  ),
                  height: 40,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('images/event1.jpeg'),
                              width: 115,
                              height: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('images/event3.jpeg'),
                              width: 115,
                              height: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('images/event1.jpeg'),
                              width: 115,
                              height: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('images/event2.jpeg'),
                              width: 115,
                              height: 115,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: _launchURL,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber)),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'EVENT REPORT',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
