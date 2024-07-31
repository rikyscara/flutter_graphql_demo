import 'package:flutter/material.dart';

class FilmTileCell extends StatelessWidget {
  const FilmTileCell({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final cellStyle = BoxDecoration(color: Colors.grey[200]);
    return Expanded(
      child: Container(
        decoration: cellStyle,
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
