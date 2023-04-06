import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import 'Screens/homescreen.dart';

void main() {
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {Song_Screen.routeName: (context) => Song_Screen()},
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'Spotify',
    );
  }
}
