import 'package:flutter/material.dart';

class AddFilmButton extends StatelessWidget {
  const AddFilmButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Add Film'),
    );
  }
}
