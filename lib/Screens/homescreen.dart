import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/addsongs.dart';
import 'package:spotify_clone/Widgets/anime.dart';
import 'package:spotify_clone/Widgets/phonk.dart';
import 'package:spotify_clone/Screens/search_screen.dart';
import 'package:spotify_clone/Widgets/miniplayer.dart';
import 'package:spotify_clone/Widgets/punjabi.dart';

import 'package:spotify_clone/Widgets/song_jbi.dart';
import '../Models/song_model.dart';

import '../Widgets/song_recommend.dart';
import '../Widgets/greeting.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(1, 158, 156, 156),
            Colors.black,
          ],
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Text(
                        greeting(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: screenWidth * 0.1,
                      child: IconButton(
                        icon: const Icon(
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
                    SizedBox(
                      width: screenWidth * 0.1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                      child: IconButton(
                        icon: const Icon(
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
                children: const [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SongREC(),
              Row(
                children: const [
                  Text(
                    'Jump back in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SongJBI(),
              Row(
                children: const [
                  Text(
                    'Phonk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Phonk(),
              Row(
                children: const [
                  Text(
                    'Anime',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Anime(),
              Row(
                children: const [
                  Text(
                    'Punjabi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              PunjabiSongs(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
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
