part of 'film_cubit.dart';

@immutable
sealed class FilmState {
  const FilmState({required this.films});

  final List<Film> films;
}

class FilmInitial extends FilmState {
  const FilmInitial({required super.films});
}

class FilmLoading extends FilmState {
  const FilmLoading({required super.films});
}

class FilmLoaded extends FilmState {
  const FilmLoaded({required super.films});
}

class FilmError extends FilmState {
  const FilmError({required super.films, required this.error});

  final String error;
}

class FilmUpdated extends FilmState {
  const FilmUpdated({required super.films});
}

class FilmDeleted extends FilmState {
  const FilmDeleted({required super.films});
}
