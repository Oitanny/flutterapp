import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'studentIssues.dart';
import 'dynamic_events.dart';
class LocalNotitficationService{
  //for displaying banner of foreground notification
  static final FlutterLocalNotificationsPlugin _notificationBanner=FlutterLocalNotificationsPlugin();

  static void initialise() async{
    final InitializationSettings initializationSettings=InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher")
    );
    await _notificationBanner.initialize(initializationSettings,onDidReceiveNotificationResponse: havePayload );
  }
  static void showNotifOnForeground(RemoteMessage message){
      var screen=message.data['title_event'];
    _notificationBanner.show(DateTime.now().microsecond, message.notification!.title, message.notification!.body,NotificationDetails(
      android: AndroidNotificationDetails(
       "com.example.mscapp","upload_files", importance: Importance.max, priority: Priority.high
      ),
    ),payload: screen);
  }

}
void havePayload(NotificationResponse notificationResponse){
  navKey.currentState?.push(MaterialPageRoute(builder: (_) =>EventNew(eventName: notificationResponse.payload.toString())));

}
