import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class Society1 extends StatefulWidget {
  _Society1State createState() => _Society1State();
}

class _Society1State extends State<Society1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0091DE),
          title: Text(
            'Placement & Internship Cell',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20.0,
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
                    builder: (context) => tabsPage(selectedIndex: 1)),
              );
            },
          ),
        ),
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
                      child: Image.network(
                        'https://th.bing.com/th/id/R.ad87952193bbbba244aa319c990c266e?rik=qOCC54B9qQAz3Q&riu=http%3a%2f%2fmscw.ac.in%2fresources%2fimg%2fslider%2fcol2.jpg&ehk=7CE1DKAp2EXaQj0C3Tn4kSYMZ0R%2fihTU3NbD%2bNbQxp8%3d&risl=&pid=ImgRaw&r=0',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    // margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xFFFFBA15),
                    width: 2000,
                    height: 40,
                    child: Text(
                      'Faculty Head',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage('images/Kalpana_App.jpeg'),
                            width: 115,
                            height: 115,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: AssetImage('images/Ashema_App.jpeg'),
                            width: 115,
                            height: 115,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'Dr. S.Kalpana Devi',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 13, color: Color(0xFF525252)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          'Ms.Ashema Hasti ',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13, color: Color(0xFF525252)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            'CONVENER',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 10, color: Color(0xFF525252)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 15,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            'CO-CONVENER',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 10, color: Color(0xFF525252)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    color: Color(0xFFFFBA15),
                    width: 2000,
                    height: 40,
                    child: Text(
                      'Student Incharge',
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
                    // margin: EdgeInsets.only(left: 20),
                    // padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Vanisha Mathur',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'PRESIDENT',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                '\n Yakshi Goel',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'SECRETARY',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                '\n Anoushka Kalawatia',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'JOINT-SECRETARY',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Aaushika Sharma',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'VICE PRESIDENT',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                '\n Kavya Thakur',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'SECRETARY',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                '\n Vibhuti Gupta',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF525252)),
                                ),
                              ),
                              Text(
                                'JOINT-SECRETARY',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 10, color: Color(0xFF525252)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*   SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    // padding: EdgeInsets.all(10.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          ' Student 3',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(fontSize: 13, color: Color(0xFF525252)),
                          ),
                        ),
                        Spacer(),
                        Text(
                          ' Student 4',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(fontSize: 13, color: Color(0xFF525252)),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xFFFFBA15),
                    width: 2000,
                    height: 40,
                    // margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'About Society',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(10),
                    child: Text(
                      'The Placement & Internship Cell of the College, started in the year2005, aims at providing a variety of internship and placement opportunities to suit the different needs of the students.A number of talks and workshops are also organised regularly to bridge the knowledge gap among students.The Cell is managed efficiently by students under the guidance of acompetent faculty',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 13, color: Color(0xFF525252)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Color(0xFFFFBA15),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    width: 2000,
                    height: 40,
                    // margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Society Events',
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
                  /*   Container(
                    color: Color(0xFFFFBA15),
                    width: 2000,
                    height: 40,
                    // margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'About Society',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(10),
                    child: Text(
                      'The Placement & Internship Cell of the College, started in the year2005, aims at providing a variety of internship and placement opportunities to suit the different needs of the students.A number of talks and workshops are also organised regularly to bridge the knowledge gap among students.The Cell is managed efficiently by students under the guidance of acompetent faculty',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 13, color: Color(0xFF525252)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),*/
                  Container(
                    margin: EdgeInsets.all(10),

                    // padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1. UN-LOCK BENEFITS OF LINKEDIN',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF525252)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'When it comes to utilizing social network as a tool to advance your professional career, LinkedIn is at the top of the list and incomparable to any other social network when it comes to business. With this notion, on 4th September 2021, The Placement and Internship Cell, Mata Sundri College for Women, hosted an interactive session on “Un-Lock Benefits of LinkedIn” by Mr. Priyank Ahuja, who is a stalwart of the industry with 14 years of experience in projects in varied domains like Product Marketing, Management Consulting and Operations.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 13, color: Color(0xFF525252)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text("Read More",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                        ),
                        Text(
                          '2. AN INTERACTIVE SESSION ON ANGULAR AND NODE JS',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF525252)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'The Placement and Internship Cell, Mata Sundri College for Women, hosted an interactive session on “Angular and Node JS” by two prestigious members of 9LedgePro, Mr. Parth Shukla and Mr. Aniket Kalvit',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 13, color: Color(0xFF525252)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text("Read More",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                        ),
                        Text(
                          '3. FINANCIAL WELLNESS',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF525252)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'The Placement and Internship Cell, Mata Sundri College for Women, hosted an interactive session on “Financial Wellness” by one of the prestigious members of BIAP, Ms. Daksha Gogia',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 13, color: Color(0xFF525252)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          child: Text("Read More",
                              style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         color: Color(0xFF6C6C6C),
        //       ),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.people, color: Color(0xFF6C6C6C)),
        //       label: "Socities",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.highlight, color: Color(0xFF6C6C6C)),
        //       label: "Events",
        //     ),
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'btn13',
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
      ),
    );
  }
}
/*
class CustomListStyle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListStyle(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
      child: InkWell(
        onTap: () => {},
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: Color(0xFF6C6C6C),
              ),
              Padding(
                padding: EdgeInsets.all(9),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
