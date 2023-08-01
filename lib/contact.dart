import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';

class ContactUs extends StatefulWidget {
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
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
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://th.bing.com/th/id/R.ad87952193bbbba244aa319c990c266e?rik=qOCC54B9qQAz3Q&riu=http%3a%2f%2fmscw.ac.in%2fresources%2fimg%2fslider%2fcol2.jpg&ehk=7CE1DKAp2EXaQj0C3Tn4kSYMZ0R%2fihTU3NbD%2bNbQxp8%3d&risl=&pid=ImgRaw&r=0',
                        width: 400,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Card(
                      //padding:EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Color(0xFFF0F0F0),
                      child: Row(
                        children: [
                          Center(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                  color: Color(0xFFFFBA15),
                                ),
                                child: Icon(
                                  Icons.call,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          // Text(
                          //   '23236102',
                          //   style: GoogleFonts.roboto(
                          //     textStyle: TextStyle(
                          //       color: Color(0xFF525252),
                          //       fontSize: 13,
                          //     ),
                          //   ),
                          // ),
                          // new InkWell(
                          //   child: new Text('23236102'),
                          //   onTap: () => launch("tel:+23236102"),
                          // ),
                          TextButton(
                            onPressed: () {
                              launchUrl(Uri.parse("tel:+01123236102"));
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered))
                                      return Colors.blue;
                                    return Colors.black;
                                  }),
                            ),
                            child: const Text(
                              '01123236102',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Center(
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                  color: Color(0xFFFFBA15),
                                ),
                                child: Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          // Text(
                          //   '23221449, 23237291',
                          //   style: GoogleFonts.roboto(
                          //     textStyle: TextStyle(
                          //       color: Color(0xFF525252),
                          //       fontSize: 13,
                          //     ),
                          //   ),
                          // ),
                          // new InkWell(
                          //   child: new Text('23221449, '),
                          //   onTap: () => launchUrl(Uri.parse("tel:+23221449")),
                          // ),
                          // new InkWell(
                          //   child: new Text('23237291'),
                          //   onTap: () => launchUrl(Uri.parse("tel:+23237291")),
                          // ),
                          Row(children: [
                            TextButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:+01123221449"));
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.hovered))
                                        return Colors.blue;
                                      return Colors.black;
                                    }),
                              ),
                              child: const Text(
                                '01123221449,',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:+01123237291"));
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                      if (states.contains(MaterialState.hovered))
                                        return Colors.blue;
                                      return Colors.black;
                                    }),
                              ),
                              child: const Text(
                                '01123237291',
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ])
                        ],
                      ),
                    ),
                    Card(
                      //padding:EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 27.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Principal Office",
                                  style:
                                  GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                              new InkWell(
                                child: new Text(
                                  'matasundricollege.du@gmail.com',
                                  style: TextStyle(color: Color(0xFF0091DE)),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'mailto:matasundricollege.du@gmail.com?subject=test%20subject&body=test%20body')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 27.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Admin Office",
                                  style:
                                  GoogleFonts.roboto(fontWeight: FontWeight.bold)),
                              new InkWell(
                                child: new Text(
                                  'mscadmin@ms.du.ac.in',
                                  style: TextStyle(color: Color(0xFF0091DE)),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'mailto:mscadmin@ms.du.ac.in?subject=test%20subject&body=test%20body')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              Icons.language_outlined,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              // Text(
                              //   // 'Visit Our Website',
                              //   //textAlign: TextAlign.left,
                              //   style: GoogleFonts.roboto(
                              //     textStyle: TextStyle(
                              //       color: Color(0xFF525252),
                              //       fontSize: 13,
                              //     ),
                              //   ),
                              // ),
                              // new InkWell(
                              //   child: new Text('Visit Our Website'),
                              //   onTap: ()  => launch('https://mscw.ac.in/'),
                              // ),
                              TextButton(
                                onPressed: () {
                                  launchUrl(Uri.parse('https://mscw.ac.in/'));
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return Colors.blue;
                                        return Colors.black;
                                      }),
                                ),
                                child: const Text(
                                  'Visit Our Website',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          // Text(
                          //   'Visit Our Facebook Page',
                          //   // Web URL('https://www.facebook.com/Mata-Sundri-CollegeDelhi-University-302041873181290/'),
                          //   style: GoogleFonts.roboto(
                          //     textStyle: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 13,
                          //     ),
                          //   ),
                          // ),
                          Column(
                            children: [
                              // Text(
                              //   // 'Visit Our Facebook Page',
                              //   //textAlign: TextAlign.left,
                              //   style: GoogleFonts.roboto(
                              //     textStyle: TextStyle(
                              //       color: Color(0xFF525252),
                              //       fontSize: 13,
                              //     ),
                              //   ),
                              // ),
                              // new InkWell(
                              //   child: new Text('Visit Our Facebook Page'),
                              //   onTap: () => launchUrl(Uri.parse('https://www.facebook.com/Mata-Sundri-CollegeDelhi-University-302041873181290/')),
                              // ),

                              TextButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      'https://www.facebook.com/Mata-Sundri-CollegeDelhi-University-302041873181290/'));
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return Colors.blue;
                                        return Colors.black;
                                      }),
                                ),
                                child: const Text(
                                  'MSCW Facebook Page',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              // Text(
                              //   'Visit Our Twitter Page',
                              //   //textAlign: TextAlign.left,
                              //   style: GoogleFonts.roboto(
                              //     textStyle: TextStyle(
                              //       color: Color(0xFF525252),
                              //       fontSize: 13,
                              //     ),
                              //   ),
                              // ),
                              // new InkWell(
                              //   child: new Text('Visit Our Twitter Page'),
                              //   onTap: () => launchUrl(Uri.parse('https://twitter.com/mata_for')),
                              // ),
                              TextButton(
                                onPressed: () {
                                  launchUrl(Uri.parse('https://twitter.com/mata_for'));
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return Colors.blue;
                                        return Colors.black;
                                      }),
                                ),
                                child: const Text(
                                  'MSCW Twitter Page',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 13.0),
                      color: Colors.grey[200],
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Color(0xFFFFBA15),
                            ),
                            child: Icon(
                              FontAwesomeIcons.instagramSquare,
                              color: Colors.black,
                              size: 30.0,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          // Text(
                          //   'Visit Our Facebook Page',
                          //   // Web URL('https://www.facebook.com/Mata-Sundri-CollegeDelhi-University-302041873181290/'),
                          //   style: GoogleFonts.roboto(
                          //     textStyle: TextStyle(
                          //       color: Colors.black,
                          //       fontSize: 13,
                          //     ),
                          //   ),
                          // ),
                          Column(
                            children: [
                              // Text(
                              //   // 'Visit Our Facebook Page',
                              //   //textAlign: TextAlign.left,
                              //   style: GoogleFonts.roboto(
                              //     textStyle: TextStyle(
                              //       color: Color(0xFF525252),
                              //       fontSize: 13,
                              //     ),
                              //   ),
                              // ),
                              // new InkWell(
                              //   child: new Text('Visit Our Instagram Page'),
                              //   onTap: () => launchUrl(Uri.parse('https://instagram.com/mscwduofficial?igshid=YmMyMTA2M2Y=') ),

                              // ),
                              TextButton(
                                onPressed:() async {
        if(await canLaunchUrl(Uri.parse("https://instagram.com/mscwduofficial?igshid=YmMyMTA2M2Y="))) {
        await launchUrl(Uri.parse("https://instagram.com/mscwduofficial?igshid=YmMyMTA2M2Y="),mode: LaunchMode.externalApplication);
        } else {
        Fluttertoast.showToast(msg: "Launch Application not found");
        }
        },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return Colors.blue;
                                        return Colors.black;
                                      }),
                                ),
                                child: const Text(
                                  'MSCW Instagram Page',
                                  style: TextStyle(fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
