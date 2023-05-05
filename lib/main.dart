import 'package:flutter/material.dart';
import 'package:spotify_clone/Models/song_model.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import 'Screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Spotify());
}

class Spotify extends StatelessWidget {
  const Spotify({super.key});

  @override
  Widget build(BuildContext context) {
    final data = SongModel(
      id: 0,
      name: '',
      artist: '',
      image: Image.asset('assets/0.jpg'),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        recdata: data,
      ),
      title: 'Spotify',
    );
  }
}
