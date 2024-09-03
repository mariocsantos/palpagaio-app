import 'package:flashlight/features/flashcard/presentation/screens/add_flashcard_screen.dart';
import 'package:flashlight/features/home/domain/deck.dart';
import 'package:flashlight/features/home/presentation/widgets/deck_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _goToStudySession(BuildContext context) {
    Navigator.pushNamed(context, '/session');
  }

  _addFlashcard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddFlashcardScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              const Text(
                'Olá, Mário!',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              DeckCard(
                deck: const Deck(
                  id: '1',
                  name: 'Master deck',
                  totalCards: 10,
                  cardsToStudy: 5,
                ),
                onTap: (deck) => _goToStudySession(context),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addFlashcard(context),
        label: const Text('Add cards'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
