import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'home.dart';
import 'societies.dart';
import 'event_highlights.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Home(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: Society(),
          icon: Icon(Icons.group),
          title: Text("Socities"),
        ),
        TabNavigationItem(
          page: EventH(),
          icon: Icon(Icons.event),
          title: Text("Events"),
        ),
      ];
}
