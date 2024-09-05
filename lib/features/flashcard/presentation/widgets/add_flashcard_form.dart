import 'package:flashlight/features/flashcard/presentation/states/create_flashcard/create_flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFlashcardForm extends StatelessWidget {
  const AddFlashcardForm({super.key, required this.onAdded});

  final void Function() onAdded;

  _onSubmit(BuildContext context) async {
    String snackBarText = '';

    try {
      await context.read<CreateFlashcardCubit>().submit();

      snackBarText = 'Flashcard added successfully!';
      onAdded();
    } catch (error) {
      snackBarText = 'Ops! Something went wrong. Please try again.';
    }

    // TODO: Show  snackbar above the bottom-sheet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(snackBarText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateFlashcardCubit, CreateFlashcardState>(
        builder: (context, state) {
      return Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Front side',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<CreateFlashcardCubit>().termChanged(value);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Back side',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<CreateFlashcardCubit>().definitionChanged(value);
            },
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
            onPressed: state.canSubmit ? () => _onSubmit(context) : null,
            child: state.isSubmitting
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary,
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Add flashcard'),
          ),
        ],
      );
    });
  }
}
