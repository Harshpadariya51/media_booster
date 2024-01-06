import 'package:flutter/material.dart';

BottomNavigationBar customNavBar() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.deepPurple.shade800,
    unselectedItemColor: Colors.white,
    showUnselectedLabels: false,
    showSelectedLabels: false,
    selectedItemColor: Colors.white,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.play_circle_outline),
        label: 'Play',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people_outline),
        label: 'Profile',
      ),
    ],
  );
}
