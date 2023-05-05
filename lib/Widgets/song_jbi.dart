import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import '../Models/song_model.dart';

class SongJBI extends StatefulWidget {
  @override
  State<SongJBI> createState() => SongJBIState();
}

class SongJBIState extends State<SongJBI> {
  @override
  final List<SongModel> sjmodel = [
    SongModel(
      id: 1,
      name: 'rockstar(feat. 21 Savage)',
      artist: 'Post Malone',
      image: Image.asset('assets/rockstar.jpg'),
    ),
    SongModel(
      id: 2,
      name: 'My Ordinary Life',
      artist: 'The Living Tombstone',
      image: Image.asset('assets/mol.jpg'),
    ),
    SongModel(
      id: 3,
      name: 'House of Memories',
      artist: 'Panic! At the Disco',
      image: Image.asset('assets/ho.jpg'),
    ),
    SongModel(
      id: 4,
      name: 'After Dark',
      artist: 'Mr. Kitty',
      image: Image.asset('assets/ad.jpg'),
    ),
  ];

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: sjmodel.map((smo) {
        final data = SongModel(
          id: smo.id,
          name: smo.name,
          artist: smo.artist,
          image: smo.image,
        );

        return GridTile(
            child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Song_Screen(recdata: data),
              ),
            );
          },
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: smo.image,
                    width: 150,
                    height: 150,
                  ),
                  Container(
                    child: Text(
                      smo.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      smo.artist,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      }).toList()),
    );
  }
}
