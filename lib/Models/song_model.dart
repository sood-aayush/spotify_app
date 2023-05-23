import 'package:flutter/material.dart';

class SongModel {
  final String name;
  final String artist;
  final String image;
  final String songUrl;
  SongModel({
    required this.name,
    required this.artist,
    required this.image,
    required this.songUrl,
  });

  Map<String, dynamic> toJson() => {};
  static SongModel fromJson(Map<String, dynamic> json) => SongModel(
      name: json['name'],
      artist: json['artist'],
      image: json['image'],
      songUrl: json['song']);
}
