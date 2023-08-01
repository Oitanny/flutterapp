import 'package:flutter/material.dart';
import 'dart:async';
import 'tabsPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => tabsPage(selectedIndex: 0),
        ));
  }

  initScreen(BuildContext context) {
    AssetImage assetImage = AssetImage("images/msc_logo.png");
    Image image = Image(
      image: assetImage,
      height: 200.0,
      width: 200.0,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        /*Container(
          decoration: BoxDecoration(
            color: new Color(0xFF0091DE),
            gradient: LinearGradient(
              colors: [
                new Color(0xff0099eb),
                new Color(0xFF0091DE),
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),*/
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Mata Sundri College for Women",
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 20.0,
                color: Color(0xFF0091DE),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 2,
            )
          ],
        )
      ],
    );
  }
}
