import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_out_plan/pages/add_new_page/add_new_page.dart';
import 'package:work_out_plan/pages/favourite_page/favourite_page.dart';
import 'package:work_out_plan/pages/home_page/home_page.dart';
import 'package:work_out_plan/pages/profile_page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _maincurrentIndex = 0;

  final List <Widget> pages = [
    MyHomePage(),
    AddNewPage(),
    FavouritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WorkOutPlane",
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _maincurrentIndex,
          onTap: (index) {
            setState(() {
              _maincurrentIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.add),label: "ADD"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "FAVOURITE"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "PROFILE"),
          ],
        ),
        body: pages[_maincurrentIndex],
      ),
    );
  }
}