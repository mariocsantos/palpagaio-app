import 'package:palpagaio/features/flashcard/presentation/screens/add_flashcard_screen.dart';
import 'package:palpagaio/features/home/data/deck_repository.dart';
import 'package:palpagaio/features/home/presentation/states/deck/deck.dart';
import 'package:palpagaio/features/home/presentation/widgets/deck_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _addFlashcard(BuildContext context, BuildContext blocContext) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AddFlashcardScreen(
          onAdded: () {
            blocContext.read<DeckBloc>().add(DeckFetch());
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeckBloc(
        deckRepository: DeckRepository(),
      ),
      child: Scaffold(
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                Text(
                  'Olá, Mário!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 16),
                DeckContainer()
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<DeckBloc, DeckState>(
          builder: (blocContext, state) {
            return FloatingActionButton.extended(
              onPressed: () => _addFlashcard(context, blocContext),
              label: const Text('Add cards'),
              icon: const Icon(Icons.add),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
