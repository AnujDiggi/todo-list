// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todo_list/HomePage.dart';
import 'package:todo_list/main.dart';

class CustomBottomNavigation extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  void onItems(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 80,
      elevation: 0,
      selectedIndex: widget.currentIndex,
      onDestinationSelected: onItems,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home, color: Colors.blue,), label: "Home"),
        NavigationDestination(icon: Icon(Icons.add, color: Colors.red,), label: "Add items"),
        NavigationDestination(icon: Icon(Icons.people, color: Colors.green,), label: "Profile"),
        NavigationDestination(icon: Icon(Icons.settings, color: Colors.orange,), label: "Settings")
      ],
    );
  }
}
