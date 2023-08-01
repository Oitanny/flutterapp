import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class Faq extends StatefulWidget {
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: accordianPage());
  }
}

class accordianPage extends StatefulWidget {
  @override
  _accordianPageState createState() => _accordianPageState();
}

class _accordianPageState extends State<accordianPage> {
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
            'FAQ\'s',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
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
        ), //appbar
        drawer: SideMenu(),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMUVFHA8CngUANXLVq5b_F6rZz3gHt-qZTLg&usqp=CAU'),
                    ),
                  ),
                  GFAccordion(
                    title:
                        'I am an alumni of this college. How can I put my records in the app? ',
                    contentChild: Text(
                      'You should be able to put your records with the help of the option\ '
                      'Alumni Section'
                      ', which is available at the hamburger drawer. ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title:
                        'How can I find out about the event registration details, such as status and due date?',
                    contentChild: Text(
                      'On the homepage hamburger, click on\ '
                      'Event Highlights'
                      ' and it will show you all the details! ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title: 'How many societies are there in the college?',
                    contentChild: Text(
                      'There are a total of 10 societies. To know more about them, go to the\ '
                      'College Societies'
                      ' page. ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title:
                        'I want to give some feedback/suggestions related to the app. Where can I put it?',
                    contentChild: Text(
                      'You can put any suggestions, feedbacks, and issues related to the app and the college in the\ '
                      'Raise an Issue'
                      ' page. ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title:
                        'Is it possible to visit the college website through the app?',
                    contentChild: Text(
                      'Of course! Simply click on the\ '
                      'Visit our Website'
                      ' option available on the app. It is present both in the\ '
                      'Contact Us'
                      ' page as well as on the Homepage hamburger ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title:
                        'I am interested in knowing the history of the college, such as its establishment date. How can I do so?',
                    contentChild: Text(
                      'The Homepage Hamburger has all the details about the college. You will find everything you need regarding the college there! ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title: 'Who is eligible to publish an opportunity in the\ '
                        'Publish Opportunity'
                        ' page? ',
                    contentChild: Text(
                      'Any faculty member or Alumni  or Placement and Internship Cell of Mata Sundri college will be able to publish the opportunities. ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  GFAccordion(
                    title: 'Can I login as an admin?',
                    contentChild: Text(
                      'In the\ '
                      'Admin Login'
                      ' page, only admins are allowed to login. They will be given an username and password for the same. ',
                      style: TextStyle(color: Colors.white),
                    ),
                    collapsedIcon: Icon(Icons.add),
                    expandedIcon: Icon(Icons.minimize),
                    collapsedTitleBackgroundColor: Color(0xFFF0F0F0),
                    expandedTitleBackgroundColor: Color(0xFFF0F0F0),
                    contentBackgroundColor: Color(0xFF0091DE),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Column(
                      children: [
                        //SizedBox(width: 10.0),
                        //Padding(
                        //  padding: EdgeInsets.only(left: 4.0),
                        Text('Any more queries? Contact us on our given mail id',
                            style: TextStyle(fontSize: 14.0)),
                        //),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            SizedBox(width: 28.0),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Icon(Icons.mail_outlined,
                                  color: Colors.purple, size: 25.0),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'matasundricollege.du@gmail.com',
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ), //column
            ), //safearea
          ), //scrollview
        ), //body

        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'btn8',
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
      ),
    ); //scaffold
  }
}
