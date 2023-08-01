
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mscapp/admin_login.dart';
import 'package:mscapp/home.dart';
import 'package:mscapp/options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLogging extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _AdminLoggingState createState() => _AdminLoggingState();
}

class _AdminLoggingState extends State<AdminLogging> {
  var value;

  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  loadNewLaunch() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      bool? _value = ((sharedPreferences.getBool('counter') ?? true));
      if (_value == null) value = false;
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: value ? SignIn() : Options());
    // TODO: implement build
  }
}
