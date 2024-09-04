import 'package:flashlight/features/flashcard/presentation/widgets/flashcard.dart';
import 'package:flashlight/features/flashcard/presentation/widgets/flip_card.dart';
import 'package:flashlight/features/study_session/domain/difficult.dart';
import 'package:flashlight/features/study_session/presentation/widgets/difficulty_button.dart';
import 'package:flashlight/features/study_session/presentation/widgets/study_section_progress.dart';
import 'package:flutter/material.dart';

class StudySessionScreen extends StatelessWidget {
  const StudySessionScreen({super.key});

  _onDifficultySelected(BuildContext context, Difficult difficult) {
    Navigator.pushNamed(context, '/session/completed');
  }

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
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
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
        title: const StudySectionProgress(current: 0, total: 10),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Flexible(
                child: FlipCard(
                  front: FlashCard(
                    text: 'I would like to checking to my flight to L.A',
                    audioUrl:
                        'https://storage.googleapis.com/flashlight-audios/hello%2C-mario',
                    isFront: true,
                  ),
                  back: FlashCard(
                    text:
                        'Eu gostaria de fazer o check-in do meu voo para Los Angeles',
                    audioUrl:
                        'https://storage.googleapis.com/flashlight-audios/hello%2C-mario',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DifficultyButton(
                    difficult: Difficult.easy,
                    onPressed: () {
                      _onDifficultySelected(context, Difficult.easy);
                    },
                  ),
                  DifficultyButton(
                    difficult: Difficult.regular,
                    onPressed: () {
                      _onDifficultySelected(context, Difficult.regular);
                    },
                  ),
                  DifficultyButton(
                    difficult: Difficult.hard,
                    onPressed: () {
                      _onDifficultySelected(context, Difficult.hard);
                    },
                  ),
                  DifficultyButton(
                    difficult: Difficult.forgot,
                    onPressed: () {
                      _onDifficultySelected(context, Difficult.forgot);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
