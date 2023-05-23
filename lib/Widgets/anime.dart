import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import '../Models/song_model.dart';
import '../Screens/song_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  Stream<List<SongModel>> readUsers() => FirebaseFirestore.instance
      .collection('anime')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => SongModel.fromJson(doc.data())).toList());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SongModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('The Error:- ${snapshot.error}');
          } else if (snapshot.hasData) {
            final songmodels = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: songmodels.map(buildUser).toList()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buildUser(SongModel ssss) {
    SongModel data = SongModel(
        name: ssss.name,
        artist: ssss.artist,
        image: ssss.image,
        songUrl: ssss.songUrl);
    return GridTile(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Song_Screen(recdata: data),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.network(ssss.image),
            ),
            Text(
              ssss.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              ssss.artist,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
