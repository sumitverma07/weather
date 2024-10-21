import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigations = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.blue,
      onTap: _onItemTapped,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Container(),
      bottomNavigationBar: navigations,
    );
  }
}
