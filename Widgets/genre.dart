import 'package:flutter/material.dart';
import '../Models/genre_model.dart';

class Genre extends StatefulWidget {
  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  final List<GenreModel> genre = [
    GenreModel(
      id: 1,
      name: 'Pop',
      description: 'Very Poppy',
    ),
    GenreModel(
      id: 2,
      name: 'Pop2',
      description: 'Very Poppy2',
    ),
    GenreModel(
      id: 3,
      name: 'Pop3',
      description: 'Very Poppy3',
    ),
    GenreModel(
      id: 4,
      name: 'Pop4',
      description: 'Very Poppy4',
    ),
  ];

  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: genre.length,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 3,
        mainAxisSpacing: 2,
      ),
      children: [
        const SizedBox(
          height: 50,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
        Row(
            children: genre.map((gen) {
          return GridTile(
              child: Text(
            gen.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ));
        }).toList()),
      ],
    );
  }
}
