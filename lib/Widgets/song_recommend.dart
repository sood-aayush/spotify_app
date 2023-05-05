import 'package:flutter/material.dart';
import 'package:spotify_clone/Screens/song_screen.dart';
import '../Models/song_model.dart';
import '../Screens/song_screen.dart';

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
        final data = SongModel(
          id: smo.id,
          name: smo.name,
          artist: smo.artist,
          image: smo.image,
        );
        return GridTile(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Song_Screen(recdata: data),
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
