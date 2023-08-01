import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mscapp/dynamic_events.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'event1.dart';
import 'event2.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'localnotificationbanner.dart';
import 'dart:convert';
GlobalKey<NavigatorState> navKey=GlobalKey<NavigatorState>();
Future<void> backgroundNotifReceiver(RemoteMessage message) async{
  print("There is a notification, current app state: background");
  print(message.notification!.title);
  print(message.notification!.body);
}


void main() async {
  String? deviceTokenToSendPushNotification;
  WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.length==0) {
  //
  await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyCh51QWqfqgSJhtziLoKhiERQDD43pjlxc',
          appId: '1:243388321219:android:13d3c17a10211e12b40176',
          messagingSenderId: '243388321219',
          projectId: 'upload-files-6ffbb',
          storageBucket: 'gs://upload-files-6ffbb.appspot.com',
        )
        , name: "upload-files");
  FirebaseMessaging.onBackgroundMessage(backgroundNotifReceiver);
  //await FirebaseMessaging.instance.subscribeToTopic("events_notif");

  await FirebaseMessaging.instance.getToken().then((value) {
    // if (true) {
    //   print("##########----" + value.toString());
    FirebaseFirestore.instance.collection('registration_ids_devices').doc(value.toString()).set({"reg_id":value.toString()});
      // FirebaseFirestore.instance.collection('registration_ids_devices').add({
      //   'reg_id': value.toString(),
      // });
    // }
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  String notifReceived="Waiting for notification...";

  @override
  void initState(){

    super.initState();
    LocalNotitficationService.initialise();

     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //when app isn't running (terminated) and when notification pops up and user clicks on it
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if(event!=null){
        var response =event.data['title_event'];
        navKey.currentState?.push(MaterialPageRoute(builder: (_) =>EventNew(eventName: response)));

      }   });

    //foreground
    FirebaseMessaging.onMessage.listen((event){
      LocalNotitficationService.showNotifOnForeground(event);
      var response =event.data['title_event'];
      print(response);
    });

    //when app is in Background, when notification pops up and user clicks on it
    FirebaseMessaging.onMessageOpenedApp.listen((event){
      var response =event.data['title_event'];
      navKey.currentState?.push(MaterialPageRoute(builder: (_) =>EventNew(eventName: response)));

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.roboto().fontFamily),
      debugShowCheckedModeBanner: false,
      navigatorKey: navKey,
      home: SplashScreen(),
      routes: {
        'event1': (context) => Event1(),
        'event2': (context) => Event2(),
      },
    );
  }
}
