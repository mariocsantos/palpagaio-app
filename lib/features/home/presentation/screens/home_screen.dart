import 'package:flashlight/features/flashcard/presentation/screens/add_flashcard_screen.dart';
import 'package:flashlight/features/home/data/deck_repository.dart';
import 'package:flashlight/features/home/presentation/states/deck/deck.dart';
import 'package:flashlight/features/home/presentation/widgets/deck_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              BlocProvider(
                create: (context) => DeckBloc(
                  deckRepository: DeckRepository(),
                ),
                child: const DeckContainer(),
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
