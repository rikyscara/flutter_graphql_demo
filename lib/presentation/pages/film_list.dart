import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_demo/application/cubit/film_cubit.dart';
import '../widgets/add_film_bottom_sheet.dart';
import '../widgets/film_list_view.dart';

class FilmList extends StatefulWidget {
  const FilmList({super.key});

  @override
  State<FilmList> createState() => _FilmListState();
}

class _FilmListState extends State<FilmList> {
  PersistentBottomSheetController? _bottomSheetController;

  void _showBottomSheet() {
    _bottomSheetController = showBottomSheet(
      context: context,
      builder: (context) => AddFilmBottomSheet(
        onClose: _closeBottomSheet,
      ),
    );
  }

  void _closeBottomSheet() {
    _bottomSheetController?.close();
    _bottomSheetController = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilmCubit, FilmState>(
      listener: (context, state) {
        if (state is FilmError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: _showBottomSheet,
              child: Icon(
                  _bottomSheetController != null ? Icons.close : Icons.add),
            ),
            body: FilmListView(films: state.films),
          ),
        );
      },
    );
  }
}
