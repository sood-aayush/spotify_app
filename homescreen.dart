import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ))
      ]),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          tooltip: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          tooltip: 'Library',
        ),
      ]),
    );
  }
}
