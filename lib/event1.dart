import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tabsPage.dart';
import 'package:url_launcher/url_launcher.dart';

class Event1 extends StatefulWidget {
  _Event1State createState() => _Event1State();
}

class _Event1State extends State<Event1> {
  List<String> imgurls=[
    'images/img1.png',
    'images/img2.png',
    'images/img3.png',
    'images/img4.png',
    'images/img1.png',
  ];
  _launchURL() async {
    const url =
        'https://www.canva.com/design/DAEnWbapnsE/DyOgxcjDnWQMRV3Tkzb55g/view?utm_content=DAEnWbapnsE&utm_campaign=designshare&utm_medium=link&utm_source=publishpresent';
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
          'Peer Mentorship Program',
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
      //   heroTag: 'btn6',
      //   onPressed: () async {
      //     if(await canLaunchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"))) {
      //     await launchUrl(Uri.parse("https://t.me/+I9VP_oFCLxc1MmVl"),mode: LaunchMode.externalApplication);
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
                SizedBox(
                  height: 200.0,
                  width: 400.0,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      // boxFit: BoxFit.cover,
                      autoPlay: true,
                      // animationCurve: Curves.fastOutSlowIn,
                      // animationDuration: Duration(milliseconds: 2000),
                      // dotSize: 4.0,
                      // dotColor: Colors.white,
                      // dotBgColor: Colors.transparent,
                      // dotPosition: DotPosition.bottomCenter,
                      // dotVerticalPadding: 20.0,
                      // showIndicator: true,
                      // indicatorBgPadding: 6.0,
                    ),
                    items:imgurls.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(
                            //   boxFit: BoxFit.cover,
                            // ),
                            child: Image.asset(i),
                          );
                        },
                      );
                    }).toList(),


                  ),

                  // child: Carousel(
                  //   images: [
                  //     Image.asset('images/img1.png'),
                  //     Image.asset('images/img2.png'),
                  //     Image.asset('images/img3.png'),
                  //     Image.asset('images/img4.png'),
                  //     Image.asset('images/img1.png'),
                  //   ],
                  //   boxFit: BoxFit.cover,
                  //   autoplay: true,
                  //   animationCurve: Curves.fastOutSlowIn,
                  //   animationDuration: Duration(milliseconds: 2000),
                  //   dotSize: 4.0,
                  //   dotColor: Colors.white,
                  //   dotBgColor: Colors.transparent,
                  //   dotPosition: DotPosition.bottomCenter,
                  //   dotVerticalPadding: 20.0,
                  //   showIndicator: true,
                  //   indicatorBgPadding: 6.0,
                  // ),
                ),
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
                        'A 30 hour peer mentorship programme on the Topic: Blender and 3-D Animation was held virtually in the college from 5th August 2021- 31st August 2021. The students learnt the basics of Blender, which included all its tools, functionalities, and the various shortcut keys used in the software. Rigourous work started from the second day of the workshop, where the first 3-D project made was an astronaut. With the constant support and enthusiasm of the students, they made a room, and a society as well. Animating the various features of the models were also well explained. Overall, 3 amazing projects complete with modelling and animation came at the end of the workshop, along with satisfied students as well as volunteers, who got to don another feather in their cap. Two assessments were held, one in the middle, and the final one in the end, in which students scored excellent marks. A collection of the best models and animations were shown at the end of the program, which was praised by all. The peer mentorship program was headed by Ms. Ashema Hasti, Department of Computer Science. It was a very successful programme, and everybody enjoyed their best.',
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(fontSize: 13),
                          color: Color(0xFF525252),
                        ),
                      )),
                ),
                SizedBox(
                  height: 10,
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Programme Name: 3D Animation using Blender',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF525252),
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Duration: 30 hours',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF525252),
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
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Number of Participants: 53',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Color(0xFF525252),
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
                            child: Image.asset(
                              'images/img1.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/img2.png',
                              width: 150,
                              height: 150,
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
                            child: Image.asset(
                              'images/img3.png',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/img4.png',
                              width: 150,
                              height: 150,
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
                            'EVENT VALEDICTORY SESSION PPT',
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
