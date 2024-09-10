import 'package:palpagaio/features/home/presentation/states/deck/deck.dart';
import 'package:palpagaio/features/home/presentation/widgets/deck_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckContainer extends StatelessWidget {
  const DeckContainer({super.key});

  _goToStudySession(BuildContext context) {
    Navigator.pushNamed(context, '/session');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Move it another place
    DeckBloc deckBloc = BlocProvider.of<DeckBloc>(context);
    deckBloc.add(
      DeckFetch(),
    );

    return BlocBuilder<DeckBloc, DeckState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.error != null) {
          return const Center(
            child: Text('An error occurred'),
          );
        }

        if (state.deck == null) {
          return const Center(
            child: Text('No decks found'),
          );
        }

        return DeckCard(
          deck: state.deck!,
          onTap: (deck) => _goToStudySession(context),
        );
      },
    );
  }
}
