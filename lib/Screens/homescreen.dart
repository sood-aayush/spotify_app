import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/search_screen.dart';
import 'package:spotify_clone/Widgets/song_jbi.dart';

import '../Widgets/song_recommend.dart';
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
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: [
                  Text(
                    greeting(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  new Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search_Screen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    'Recommended',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                new Spacer(),
              ],
            ),
            SongREC(),
            Row(
              children: [
                Container(
                  child: Text(
                    'Jump back in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                new Spacer(),
              ],
            ),
            SongJBI(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_add,
              color: Colors.white,
            ),
            label: 'My Library',
          ),
        ],
      ),
    );
  }
}
