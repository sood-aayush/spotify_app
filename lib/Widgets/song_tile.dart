// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spotify_clone/Models/song_model.dart';

class SongTile extends StatelessWidget {
  @override
  final List<SongModel> smodel = [
    SongModel(
      id: 1,
      name: 'Blinding Lights',
      artist: 'Weeknd',
      genre: 'Pop',
      image: Image.asset('assets/bl.jpg'),
    ),
    SongModel(
      id: 2,
      name: 'Under the Tree',
      artist: 'Sim',
      genre: 'Pop',
      image: Image.asset('assets/udt.png'),
    ),
    SongModel(
      id: 3,
      name: 'Metamorphosis',
      artist: 'Interworld',
      genre: 'Pop',
      image: Image.asset('assets/meta.jpg'),
    ),
    SongModel(
      id: 4,
      name: 'Sex, Drugs, Etc.',
      artist: 'Beach Weather',
      genre: 'Pop',
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
