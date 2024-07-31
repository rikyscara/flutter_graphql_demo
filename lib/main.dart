import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'application/cubit/film_cubit.dart';
import 'data/film_repository.dart';
import 'presentation/pages/film_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = 'https://zrrgzwbdxkgbksjkptqd.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  runApp(MainApp(db: supabase));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.db});

  final Supabase db;

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
