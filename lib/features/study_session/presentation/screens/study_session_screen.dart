import 'package:flashlight/features/study_session/presentation/widgets/flashcard.dart';
import 'package:flashlight/features/study_session/presentation/widgets/flip_card.dart';
import 'package:flutter/material.dart';

class StudySessionScreen extends StatelessWidget {
  const StudySessionScreen({super.key});

  _confirmExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure you want to exit?'),
          content: const Text('You will lose your progress.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Modal is dismissed
                Navigator.pop(context); // Screen is closed
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _confirmExit(context);
          },
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              FlipCard(
                front: FlashCard(
                  text: 'English sentence',
                ),
                back: FlashCard(text: 'Portuguese translation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
