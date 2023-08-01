import 'package:flutter/material.dart';
// import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<String> imgurls=[
    'mata_sundri_ji.jpg',
    'https://images.shiksha.com/mediadata/images/1609322524phpbKd5dz.png',
    'https://images.shiksha.com/mediadata/images/1609322583phpfd6f0k.png',
    'https://mscw.ac.in/resources/img/gallery/bani_kirtan/b2.jpg',
    'https://images.shiksha.com/mediadata/images/1609322646phpWw9JP9.png'
  ];
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
            title: Text(
              "About MSCW",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            backgroundColor: Color(0xff0091DE),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => tabsPage(selectedIndex: 0)),
                    );
                    //Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          drawer: SideMenu(),
          body: ListView(
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
                            decoration: BoxDecoration(
                                color: Colors.blue
                            ),
                            child: i=='mata_sundri_ji.jpg'?Image.asset('images/mata_sundri_ji.jpg'):Image.network(i),
                        );
                      },
                    );
                  }).toList(),
                  // images: [
                  //   Image.network(
                  //       'https://www.edufever.com/wp-content/uploads/2018/06/Mata-Sundri-College-For-Women-Delhi.jpg'),
                  //   Image.network(
                  //       'https://images.shiksha.com/mediadata/images/1609322524phpbKd5dz.png'),
                  //   Image.network(
                  //       'https://images.shiksha.com/mediadata/images/1609322583phpfd6f0k.png'),
                  //   Image.network(
                  //       'https://images.shiksha.com/mediadata/images/1609322583phpfd6f0k.png'),
                  // ],

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                width: 900.0,
                color: Color(0xff0091DE),
                child: Center(
                  child: Text(
                    "ABOUT US",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      height: 2,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Center(
                  child: Text(
                    "Mata Sundri College for Women is an institution where we strive to achieve excellence in higher education and women empowerment. A constituent college of University of Delhi, the college was founded on 17 July 1967 by the Gurdwara Parbandhak Committee, Delhi State                   caters to education of young women preparing them for life by promoting their intellectual sensitivities. We are proud to have a strength of 4066 vibrant young women in the college. There are 166 distinguished faculty members and 64 members of the Non-teaching Staff. With its extremely well-qualified teaching faculty and an efficient support staff backing them, the college provides an ideal learning environment for the young women as they embark on their journey of life, giving shape to their most cherished dreams and wings to their creative pursuits. We provide liberal education in Humanities, Commerce as well as Sciences. Our college is one of the eight colleges of University of Delhi which offer the B.El.Ed. course that is an integrated professional degree programme. With a view to encouraging skill-based education, we offer various skill development programmes like Basic and Advanced Courses in Computers, Travel & Tourism, Textile Designing, Foreign Languages etc. Our mission is to provide quality education to students that not only nurtures individual talents but also fosters a spirit of camaraderie and teamwork. This is blended ith sound values and ideals. Innovative teaching methods including experiential activities, project work and field work are an inherent aspect of the teaching-learning process. Backed by thorough mentoring on an individual level by teachers, students are provided not only with a strong conceptual foundation but also market-driven skills and competencies to succeed in a competitive world. We make all endeavours to infuse a spirit of research among faculty and students as we recognize that it is the edifice for any Institution of higher learning. Besides our commitment to academic excellence, we also pursue a flurry of co-curricular activities with equal enthusiasm for all-around development of the students. Located in the heart of Delhi, with easy accessibility to metro stations of I.T.O, Rajiv Chowk, Barakhamba Road and Mandi House, the college is an ideal destination for those who choose to chart out their own unique trajectory.",
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 12.0,
                      height: 1.7,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    //padding: EdgeInsets.all(2),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tabsPage(selectedIndex: 1)),
                        );
                      },
                      // color: Color(0xFFFFBA15),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // ),
                      child: Text(
                        "SOCIETIES",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //padding: EdgeInsets.all(2),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tabsPage(selectedIndex: 2)),
                        );
                      },
                      // color: Color(0xFFFFBA15),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // ),
                      child: Text(
                        "EVENTS",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   heroTag: 'btn0',
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
          // )
      ),
    );
  }
}
