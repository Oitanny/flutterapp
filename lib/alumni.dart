import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class Alumni extends StatefulWidget {
  @override
  _AlumniState createState() => _AlumniState();
}

class _AlumniState extends State<Alumni> {
  int? _value = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void validate() {
    if (formKey.currentState!.validate()) {
      print("validate");
    } else {
      print("Not Validate");
    }
  }

  String? validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Alumni Records',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
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
        ),
        // floatingActionButton: FloatingActionButton(
        //   heroTag: 'btn2',
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
        drawer: SideMenu(),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/alumni.jpg',
                  height: 150,
                  width: double.infinity,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fill this form to store the alumini details",
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: Colors.grey[800], letterSpacing: .2),
                    ),
                    textAlign: TextAlign.left,
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 15.0, top: 1.5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Fill all the mandatory fields marked with '*'",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.red, letterSpacing: .2),
                      ),
                      textAlign: TextAlign.left))),
          Container(
              height: 650.0,
              width: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Color(0xFFF0F0F0),
              ),
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Form(
                  //autovalidate: true,
                  key: formKey,
                  child: Column(children: <Widget>[
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              validator: validatepass,
                              decoration: InputDecoration(
                                  labelText: "*First Name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Last Name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                    ])),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              validator: validatepass,
                              decoration: InputDecoration(
                                  labelText: "*Company/Organizations",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: TextFormField(
                              validator: validatepass,
                              decoration: InputDecoration(
                                  labelText: "*Phone no",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                    ])),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              validator: validatepass,
                              decoration: InputDecoration(
                                  labelText: "*Currently Placed",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Designation if currently placed",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                    ])),
                    SizedBox(
                      height: 25.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                              EmailValidator(
                                  errorText: "please enter valid email ID")
                            ]),
                            decoration: InputDecoration(
                                labelText: "*Enter your Email id",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        validator: (value) => value == 0 ? "Required" : null,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        elevation: 4,
                        isExpanded: true,
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "*Select your Department",
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("Commerce"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Economics"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("English"),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text("Hindi"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("Mathematics"),
                            value: 5,
                          ),
                          DropdownMenuItem(
                            child: Text("Philosophy"),
                            value: 6,
                          ),
                          DropdownMenuItem(
                            child: Text("Political Science"),
                            value: 7,
                          ),
                          DropdownMenuItem(
                            child: Text("Punjabi"),
                            value: 8,
                          ),
                          DropdownMenuItem(
                            child: Text("Statistics"),
                            value: 9,
                          ),
                          DropdownMenuItem(
                            child: Text("Computer Science"),
                            value: 10,
                          ),
                          DropdownMenuItem(
                            child: Text("Elementary Education"),
                            value: 11,
                          ),
                          DropdownMenuItem(
                            child: Text("Environmental Science"),
                            value: 12,
                          ),
                          DropdownMenuItem(
                            child: Text("History"),
                            value: 13,
                          ),
                          DropdownMenuItem(
                            child: Text("Music"),
                            value: 14,
                          ),
                          DropdownMenuItem(
                            child:
                                Text("Physical Education and Sports Sciences"),
                            value: 15,
                          ),
                          DropdownMenuItem(
                            child: Text("Psychology"),
                            value: 16,
                          ),
                          DropdownMenuItem(
                            child: Text("Sanskrit"),
                            value: 17,
                          ),
                          DropdownMenuItem(
                            child: Text("Urdu"),
                            value: 18,
                          ),
                        ],
                        onChanged: (int? value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            validator: validatepass,
                            decoration: InputDecoration(
                                labelText: "*Enter your Course",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Description of your job role",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF04C300),
                          onPrimary: Colors.white,
                        ),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ]))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.purple[800],
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  width: 7.0,
                ),
                Text(
                  'matasundricollege.du@gmail.com',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  width: 7.0,
                ),
              ],
            ),
          )
        ]))));
  }
}
