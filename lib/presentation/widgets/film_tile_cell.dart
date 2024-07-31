import 'package:flutter/material.dart';

class FilmTileCell extends StatelessWidget {
  const FilmTileCell({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
