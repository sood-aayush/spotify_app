import 'package:flutter/material.dart';
import '../Models/genre_model.dart';
import '../Widgets/genre.dart';
import '../Widgets/greeting.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.red,
                Colors.blue,
              ]),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Text(
                greeting(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 54,
                ),
              ),
            ),
            Genre(),
          ],
        ),
      ),
    );
  }
}
