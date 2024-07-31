import 'package:flutter/material.dart';

import 'film_form_fields.dart';

class AddFilmBottomSheet extends StatelessWidget {
  final VoidCallback onClose;

  const AddFilmBottomSheet({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add Film',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: onClose,
                  ),
                ],
              ),
              const FilmFormFields(),
            ],
          ),
        );
      },
    );
  }
}
