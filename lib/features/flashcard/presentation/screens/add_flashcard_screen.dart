import 'package:flashlight/features/flashcard/data/flashcard_repository.dart';
import 'package:flashlight/features/flashcard/presentation/states/create_flashcard/create_flashcard.dart';
import 'package:flashlight/features/flashcard/presentation/widgets/add_flashcard_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFlashcardScreen extends StatelessWidget {
  const AddFlashcardScreen({super.key, required this.onAdded});

  final VoidCallback onAdded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 36,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create a new flashcard',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocProvider(
                create: (context) => CreateFlashcardCubit(
                  flashcardRepository: FlashcardRepository(),
                ),
                child: AddFlashcardForm(
                  onAdded: onAdded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
