import 'package:flutter/material.dart';
import './homescreen.dart';

void main() {
  runApp(Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'Spotify',
    );
  }
}
