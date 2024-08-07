import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubit/film_cubit.dart';
import '../../domain/film.dart';
import 'film_tile.dart';

class FilmListView extends StatelessWidget {
  final List<Film> films;

  const FilmListView({super.key, required this.films});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: films.length,
        itemBuilder: (context, index) {
          return FilmTile(
            film: films[index],
            onDelete: context.read<FilmCubit>().deleteFilm,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 1, height: 0);
        },
      ),
    );
  }
}
