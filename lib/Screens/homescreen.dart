import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/addsongs.dart';
import 'package:spotify_clone/Screens/search_screen.dart';
import 'package:spotify_clone/Widgets/miniplayer.dart';
import 'package:spotify_clone/Widgets/song_jbi.dart';
import '../Models/song_model.dart';

import '../Widgets/song_recommend.dart';
import '../Widgets/greeting.dart';

class HomeScreen extends StatefulWidget {
  final SongModel recdata;
  HomeScreen({required this.recdata});

  @override
  State<HomeScreen> createState() => _HomeScreenState(recdata: recdata);
}

class _HomeScreenState extends State<HomeScreen> {
  final SongModel recdata;
  _HomeScreenState({required this.recdata});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(1, 158, 156, 156),
            Colors.black,
          ],
        )),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: [
                  Container(
                    width: screenWidth * 0.7,
                    child: Text(
                      greeting(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  new Spacer(),
                  Container(
                    width: screenWidth * 0.1,
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddSongs(),
                            ));
                      },
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.1,
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.1,
                    child: IconButton(
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
            new Spacer(),
            Mini_Player(
              recdata: recdata,
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: <BottomNavigationBarItem>[
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
