import 'package:audioplayers/audioplayers.dart';
import 'package:flashlight/features/flashcard/presentation/widgets/flashcard.dart';
import 'package:flashlight/features/flashcard/presentation/widgets/flip_card.dart';
import 'package:flashlight/features/study_session/presentation/state/study_session/study_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudySessionCardList extends StatelessWidget {
  const StudySessionCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudySessionBloc, StudySessionState>(
      listenWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      listener: (context, state) async {
        try {
          final card = state.cards[state.currentIndex];
          final player = AudioPlayer();

          await player.play(
            UrlSource(
              card.audioUrl,
            ),
          );
        } catch (error) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to play audio'),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final inAnimation = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation);

            final outAnimation = Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(animation);

            return SlideTransition(
              position: child.key == ValueKey<int>(state.currentIndex)
                  ? inAnimation
                  : outAnimation,
              child: child,
            );
          },
          child: IndexedStack(
            key: ValueKey<int>(state.currentIndex),
            index: state.currentIndex,
            children: state.cards.map((card) {
              return FlipCard(
                front: FlashCard(
                  text: card.term,
                  audioUrl: card.audioUrl,
                  isFront: true,
                ),
                back: FlashCard(
                  text: card.definition,
                  audioUrl: card.audioUrl,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
