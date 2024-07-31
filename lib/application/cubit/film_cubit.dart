import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_demo/data/film_repository.dart';
import 'package:flutter_graphql_demo/domain/film.dart';

part 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit({required this.filmRepo}) : super(const FilmInitial(films: []));

  final FilmRepository filmRepo;

  void getFilmData() async {
    emit(FilmLoading(films: state.films));

    try {
      final List<Film> allFilms = await filmRepo.getFilmsData();

      emit(FilmLoaded(films: allFilms));
    } catch (e) {
      emit(FilmError(error: e.toString(), films: state.films));
    }
  }

  void upsertFilm(Film film, bool isUpdate) async {
    emit(FilmLoading(films: state.films));

    try {
      final Film updatedFilm = await filmRepo.upsertFilm(film, isUpdate);

      emit(FilmUpdated(films: {...state.films, updatedFilm}.toList()));
    } catch (e) {
      emit(FilmError(error: e.toString(), films: state.films));
    }
  }

  void deleteFilm(String id) async {
    emit(FilmLoading(films: state.films));

    try {
      final deletedFilm = await filmRepo.deleteFilm(id);

      emit(FilmDeleted(
          films: state.films
            ..removeWhere(
              (f) => f.id == deletedFilm.id,
            )));
    } catch (e) {
      emit(FilmError(error: e.toString(), films: state.films));
    }
  }
}
