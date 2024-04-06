import 'package:app_mob_demo_ecom/view/screen1.dart';
import 'package:app_mob_demo_ecom/view/screen2.dart';
import 'package:app_mob_demo_ecom/view/screen3.dart';
import 'package:flutter/material.dart';

import 'helper/notification_helper.dart';

void main() {
  setUpFirebase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Widget> _screens = <Widget>[
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Screen 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Screen 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Screen 3',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
