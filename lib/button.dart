import 'package:flutter/material.dart';

void navigate(BuildContext context, String route) {
  Navigator.pushNamed(context, '$route');
}

Widget customButton(String title, Color c, VoidCallback onCustomBtnPressed) {
  return SizedBox(
    height: 50.0,
    width: 160.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: c,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        onCustomBtnPressed;
      },
    ),
  );
}
