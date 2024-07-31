import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_demo/application/cubit/film_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../domain/film.dart';
import 'add_film_button.dart';

class FilmFormFields extends StatefulWidget {
  const FilmFormFields({super.key});

  @override
  State<FilmFormFields> createState() => _FilmFormFieldsState();
}

class _FilmFormFieldsState extends State<FilmFormFields> {
  final _filmTitleController = TextEditingController();
  final _filmDirectorController = TextEditingController();
  final _filmReleaseDateController = TextEditingController();

  @override
  void dispose() {
    _filmTitleController.dispose();
    _filmDirectorController.dispose();
    _filmReleaseDateController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(String hintText) => InputDecoration(
        hintText: hintText,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _filmTitleController,
          decoration: _inputDecoration("Title"),
        ),
        TextField(
          controller: _filmDirectorController,
          decoration: _inputDecoration("Director"),
        ),
        TextField(
          controller: _filmReleaseDateController,
          decoration: _inputDecoration("Release Date"),
        ),
        const SizedBox(height: 16),
        AddFilmButton(
          onPressed: () {
            context.read<FilmCubit>().upsertFilm(
                  Film(
                    id: const Uuid().v4(),
                    title: _filmTitleController.text,
                    director: _filmDirectorController.text,
                    releaseDate: _filmReleaseDateController.text,
                  ),
                  false,
                );
            _filmTitleController.clear();
            _filmDirectorController.clear();
            _filmReleaseDateController.clear();
          },
        ),
      ],
    );
  }
}
