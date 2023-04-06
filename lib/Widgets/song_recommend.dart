import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import '../Models/song_model.dart';

class Arguments {
  final int id;
  final String name;
  final String artist;
  final Image image;
  Arguments(
    this.id,
    this.name,
    this.artist,
    this.image,
  );
}

class SongREC extends StatelessWidget {
  @override
  final List<SongModel> smodel = [
    SongModel(
      id: 1,
      name: 'Blinding Lights',
      artist: 'Weeknd',
      image: Image.asset('assets/bl.jpg'),
    ),
    SongModel(
      id: 2,
      name: 'Under the Tree',
      artist: 'Sim',
      image: Image.asset('assets/udt.png'),
    ),
    SongModel(
      id: 3,
      name: 'Metamorphosis',
      artist: 'Interworld',
      image: Image.asset('assets/meta.jpg'),
    ),
    SongModel(
      id: 4,
      name: 'Sex, Drugs, Etc.',
      artist: 'Beach Weather',
      image: Image.asset('assets/ste.jpg'),
    ),
  ];
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: smodel.map((smo) {
        return GridTile(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Song_Screen.routeName,
                arguments: Arguments(
                  1,
                  'Blinding Lights',
                  'Weeknd',
                  Image.asset('assets/bl.jpg'),
                ),
              );
            },
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
        ));
      }).toList()),
    );
  }
}
