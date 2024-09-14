import 'package:palpagaio/features/authentication/presentation/states/authentication/authentication.dart';
import 'package:palpagaio/features/flashcard/presentation/screens/add_flashcard_screen.dart';
import 'package:palpagaio/features/home/data/deck_repository.dart';
import 'package:palpagaio/features/home/presentation/states/deck/deck.dart';
import 'package:palpagaio/features/home/presentation/widgets/deck_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _addFlashcard(BuildContext context, BuildContext blocContext) {
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

  void _signOut(BuildContext context) {
    final bloc = context.read<AuthenticationBloc>();
    bloc.add(SignOut());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => DeckBloc(
        deckRepository: DeckRepository(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, state) {
                        final user = state.user;
                        final name = user?.displayName?.split(' ').first ?? '';

                        return Row(
                          children: [
                            user?.photoURL == null
                                ? CircleAvatar(
                                    backgroundColor:
                                        colorScheme.surfaceContainerHigh,
                                    child: Text(
                                      name.characters.first.toUpperCase(),
                                      style: TextStyle(
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user!.photoURL!),
                                  ),
                            const SizedBox(width: 16),
                            Text(
                              'Hello, $name!',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.onSurface,
                      ),
                      onPressed: () => _signOut(context),
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const DeckContainer(),
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<DeckBloc, DeckState>(
          builder: (blocContext, state) {
            final ColorScheme colorScheme = Theme.of(context).colorScheme;

            return FloatingActionButton.extended(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              onPressed: () => _addFlashcard(context, blocContext),
              label: const Text('ADD CARDS'),
              icon: const Icon(Icons.add),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
