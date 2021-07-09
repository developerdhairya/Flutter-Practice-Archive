import 'package:boom/screens/profile_screen.dart';
import 'package:boom/screens/video_conference_screen.dart';
import 'package:boom/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageOptions = [
    VideoConferenceScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: mystyle(17, Colors.blue),
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: mystyle(17, Colors.black),
        currentIndex: page,
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Video Call",
            icon: Icon(
              Icons.video_call,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(
              Icons.person,
              size: 32,
            ),
          ),
        ],
      ),
      body: pageOptions[page],
    );
  }
}
