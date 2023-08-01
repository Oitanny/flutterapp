import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/societies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sideMenu.dart';

class departmentSociety extends StatefulWidget {
  @override
  _departmentSocietyState createState() => _departmentSocietyState();
}

class _departmentSocietyState extends State<departmentSociety> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text("Departmental Societies")
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
              )),
        ),
        // actions: <Widget>[
        //   isSearching
        //       ? IconButton(
        //     icon: Icon(Icons.cancel),
        //     onPressed: () {
        //       setState(() {
        //         this.isSearching = false;
        //       });
        //     },
        //   )
        //       : IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       setState(() {
        //         this.isSearching = true;
        //       });
        //     },
        //   )
        // ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                  Navigator.of(context).pop();

                //Navigator.pop(context);
              },
            );
          },
        ),
      ), //appbar
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'btn4',
      //   onPressed: () {},
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
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/CS_Society.aspx"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/CS_Society.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Cybernauts",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Computer Science)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ), //padding
                      ],
                    ), //column
                  ), //container
                ), //padding
                //), //onclick
                SizedBox(height: 9.0),

                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/PolSc_Cinemates.aspx"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/PolSc_Cinemates.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Polimates",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Political Science)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //padding

                SizedBox(height: 9.0),

                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://www.mscw.ac.in/Stats_Society.aspx"))) {
                      await launchUrl(Uri.parse("https://www.mscw.ac.in/Stats_Society.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Statistika",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Statistics)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //padding //onclick

                SizedBox(height: 9.0),

                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/society.aspx"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/society.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Earthcon Society",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Environmental Science)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //padding

                SizedBox(height: 9.0),

                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/punjabi.aspx#"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/punjabi.aspx#"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Aarsi",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Punjabi)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //padding
                SizedBox(height: 9.0),
                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/Com_Society.aspx"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/Com_Society.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Invictus",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of Commerce)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //padding

                SizedBox(height: 9.0),


                InkWell(
                  onTap:() async {
                    if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/Departmental_Societies.aspx"))) {
                      await launchUrl(Uri.parse("https://mscw.ac.in/Departmental_Societies.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                      Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Kasak",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of B.A. Programme)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //
                InkWell(
                  onTap:() async {
                      if(await canLaunchUrl(Uri.parse("https://mscw.ac.in/history_dept.aspx"))) {
                    await launchUrl(Uri.parse("https://mscw.ac.in/history_dept.aspx"),mode: LaunchMode.externalApplication);
                    } else {
                    Fluttertoast.showToast(msg: "Launch Application not found");
                    }

                  },
                  child: Container(
                    height: 165.0,
                    width: 400.0,
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://mscw.ac.in/resources/img/slider/Campus.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "Gatha",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //Title
                          ),
                        ), //container

                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "(Department of History)",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ), //subTitle
                          ),
                        ),

                        SizedBox(height: 8.0),

                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ), //content
                          ), //container
                        ),
                      ],
                    ), //column
                  ), //container
                ), //opacity
              ],
            ), //padding
          ),
        ),
      ),
    );
  }
}
