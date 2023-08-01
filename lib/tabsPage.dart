import 'package:flutter/material.dart';
import 'package:mscapp/event_highlights.dart';
import 'package:mscapp/home.dart';
import 'package:mscapp/societies.dart';
import 'bottom_tabs.dart';

class tabsPage extends StatefulWidget {
  int selectedIndex = 0;
  tabsPage({required this.selectedIndex});

  @override
  _tabsPageState createState() => _tabsPageState();
}

class _tabsPageState extends State<tabsPage> {
  List<Widget> wid=[
    Home(),
    Society(),
    EventH()
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Societies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
