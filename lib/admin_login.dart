import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tabsPage.dart';
import 'options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
class SignIn extends StatefulWidget {
  @override
  AdSignIn createState() {
    return AdSignIn();
  }
}

class AdSignIn extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late bool passwordVisible;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    print(passwordVisible);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => tabsPage(selectedIndex: 0)),
                );
              },
            );
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset('images/msc_logo.png', height: 70, width: 70),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 90,
                    height: 7,
                    margin: EdgeInsets.only(right: 275),
                    decoration: BoxDecoration(
                      color: Color(0xFF720792),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
            child: Text(
              'Please sign in to your Account to\ncontinue to your app',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                height: 1.7,
                fontFamily: 'Lato',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
            child: Text(
              '(Only Admins are alowed to Login)',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFFE0505),
                fontFamily: 'Lato',
              ),
            ),
          ),
          Container(
              child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 40, 50, 15),
                  child: TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF720972),
                      ),
                      hintText: "Email",
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF6C6C6C),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 40),
                  child: TextFormField(
                    obscureText: passwordVisible,
                    controller: _passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (val.length < 6) {
                        return 'Password must be at least 6 characters long.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF720972),
                      ),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF6C6C6C),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )),
          Container(
            child: Padding(
              //padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 15.0),
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  if (formKey.currentState!.validate()) {
                    sharedPreferences.setBool('counter', false);

                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "Successfully logged in!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_RIGHT,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Options()),
                      );
                    }).onError((error, stackTrace) async {
                      Fluttertoast.showToast(
                          msg: "Error:${error.toString()}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM_RIGHT,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);

                      if (sharedPreferences.containsKey('counter')) {
                        sharedPreferences.setBool('counter', true);
                      }
                    });
                  } else {
                    if (sharedPreferences.containsKey('counter')) {
                      sharedPreferences.setBool('counter', true);
                    }
                    showToast();
                  }
                },
                // color: Color(0xFF720792),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                // ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Don't have an account?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 15,
                height: 2,
              ),
            ),
          ),
          Container(
            child: Text(
              'CONTACT ADMIN OFFICE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0091DE),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
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
    );
  }
}

void showToast() =>
    Fluttertoast.showToast(msg: "Please enter values correctly", fontSize: 18);
