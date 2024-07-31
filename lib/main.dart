import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/cubit/film_cubit.dart';
import 'data/film_repository.dart';
import 'presentation/pages/film_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmCubit(filmRepo: FilmRepository())..getFilmData(),
      child: const MaterialApp(
        home: Scaffold(
          body: FilmList(),
        ),
      ),
    );
  }
}
