import 'package:flutter/material.dart';
import '../Models/song_model.dart';

class SongJBI extends StatelessWidget {
  SongJBI({super.key});

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
        return GridTile(
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
        ));
      }).toList()),
    );
  }
}
