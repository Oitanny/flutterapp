import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mscapp/localnotificationbanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NotificationHome extends StatefulWidget{
  const NotificationHome({Key? key}):super(key:key);
  @override
  NotificationHomeState createState()=>NotificationHomeState();
}
class NotificationHomeState extends State<NotificationHome>{

  String notifReceived="Waiting for notification...";
  @override
  // void initState(){
  //
  //   super.initState();
  //   LocalNotitficationService.initialise();
  //
  //
  //
  //   //when app isn't running (terminated) and when notification pops up and user clicks on it
  //   FirebaseMessaging.instance.getInitialMessage().then((event) {
  //     if(event!=null){
  //     setState((){
  //       notifReceived="Terminated: ${event.notification!.title} ${event.notification!.body}";
  //     }); }   });
  //
  //   //foreground
  //   FirebaseMessaging.onMessage.listen((event){
  //     LocalNotitficationService.showNotifOnForeground(event);
  //     setState((){
  //     notifReceived="Foreground: ${event.notification!.title} ${event.notification!.body}";
  //   });
  //
  //   });
  //
  //   //when app is in Background, when notification pops up and user clicks on it
  //   FirebaseMessaging.onMessageOpenedApp.listen((event){
  //     setState((){
  //       notifReceived="Background: ${event.notification!.title} ${event.notification!.body}";
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Notifcations"),
      ),
      body: Center(
        child:Column(
        children: [Text(
          notifReceived,
          textAlign: TextAlign.center,
        ),
        ElevatedButton(onPressed: SendNewlyAddedEventNotification, child: Text("Send Notification"))
        ]
      )),
    );
  }
}
Future<void> SendNewlyAddedEventNotification() async {
  String? deviceTokenToSendPushNotification;
  var url=Uri.parse('https://fcm.googleapis.com/fcm/send');
  var response = await http.post(url, body: jsonEncode({
    "registration_ids": [
      "dcw2iJWCSVuIQEOF51KXbB:APA91bE_Ttj7NWOtwxjoRQUQ0P8239cQEBvB93ZTcmznw1OI6Xc5dYVu8_RHUF3Yzi8Bl_nzMjSNuJEhhXfwdrk_ZaxJJPNhxApLKUufjPZot2-6RGQd_y6O_OZXtelhB4paWYXiWFv3"
    ],
    "notification": {
      "body": "hello!!!",
      "title": "New Notification",
      "android_channel_id": "com.example.mscapp",
      "image":"https://www.easylinedrawing.com/wp-content/uploads/2020/10/flower_drawing.png",
      "sound": false

    }

  }),
      headers: {
        'Content-type': 'application/json',
        "Authorization": "key=AAAAOKsTDcM:APA91bEi1FUSIHNdtcec9-rDT4fpJ3MmwFrlc6-06bWZFPCTkaP7ca5-0hpgMpMf45LTe1UmhQCyg9BHV-QhlB2A0vQHJV3EYA_rfvq0V3hURwnEGBzbjbauYTQKHJp2Nq07BVSZjlh3"}
  );
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  // final token = await _fcm.getToken();
  // deviceTokenToSendPushNotification = token.toString();
  // print("Token Value $deviceTokenToSendPushNotification");
}
