import 'package:flutter/material.dart';

class AddFlashcardForm extends StatelessWidget {
  const AddFlashcardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Front side',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Back side',
            border: OutlineInputBorder(),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
          ),
          onPressed: () {},
          child: const Text('Add flashcard'),
        ),
      ],
    );
  }
}
