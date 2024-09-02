import 'package:flashlight/features/flashcard/presentation/widgets/add_flashcard_form.dart';
import 'package:flutter/material.dart';

class AddFlashcardScreen extends StatelessWidget {
  const AddFlashcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: 36,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a new flashcard',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: AddFlashcardForm(),
            ),
          ],
        ),
      ),
    );
  }
}
