import 'package:flutter/material.dart';
import 'package:flutter_graphql_demo/domain/film.dart';

import 'film_tile_cell.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({super.key, required this.film, required this.onDelete});

  final Film film;
  final void Function(String) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilmTileCell(text: film.title),
            FilmTileCell(text: film.director),
            FilmTileCell(text: film.releaseDate),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onDelete(film.id),
        ));
  }
}
