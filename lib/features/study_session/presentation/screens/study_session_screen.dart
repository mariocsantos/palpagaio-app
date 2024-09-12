import 'package:palpagaio/features/study_session/domain/difficult.dart';
import 'package:palpagaio/features/study_session/presentation/state/study_session/study_session.dart';
import 'package:palpagaio/features/study_session/presentation/widgets/difficulty_button.dart';
import 'package:palpagaio/features/study_session/presentation/widgets/study_section_progress.dart';
import 'package:palpagaio/features/study_session/presentation/widgets/study_session_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudySessionScreen extends StatelessWidget {
  const StudySessionScreen({super.key});

  _onDifficultySelected(
    StudySessionBloc bloc,
    Difficult difficult,
  ) {
    bloc.add(
      StudySessionCardReviewed(
        difficult: difficult,
      ),
    );
  }

  _confirmExit(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;

        return AlertDialog(
          title: const Text('Are you sure you want to exit?'),
          content: const Text('You will lose your progress.'),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(colorScheme.onSurface),
              ),
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
    StudySessionBloc bloc = BlocProvider.of<StudySessionBloc>(context);
    bloc.add(
      StudySessionStarted(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _confirmExit(context);
          },
        ),
        title: BlocBuilder<StudySessionBloc, StudySessionState>(
          builder: (context, state) {
            return StudySectionProgress(
              current: state.currentIndex + 1,
              total: state.cards.length,
            );
          },
        ),
      ),
      body: BlocConsumer<StudySessionBloc, StudySessionState>(
        listenWhen: (previous, current) => current.isCompleted,
        listener: (context, state) {
          if (state.isCompleted) {
            Navigator.pushNamed(context, '/session/completed');
          }
        },
        builder: (context, state) {
          final shouldDisableButtons = state.isLoading || state.isReviewing;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Flexible(
                    child: StudySessionCardList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DifficultyButton(
                        difficult: Difficult.easy,
                        disabled: shouldDisableButtons,
                        onPressed: () {
                          _onDifficultySelected(bloc, Difficult.easy);
                        },
                      ),
                      DifficultyButton(
                        difficult: Difficult.regular,
                        disabled: shouldDisableButtons,
                        onPressed: () {
                          _onDifficultySelected(bloc, Difficult.regular);
                        },
                      ),
                      DifficultyButton(
                        difficult: Difficult.hard,
                        disabled: shouldDisableButtons,
                        onPressed: () {
                          _onDifficultySelected(bloc, Difficult.hard);
                        },
                      ),
                      DifficultyButton(
                        difficult: Difficult.forgot,
                        disabled: shouldDisableButtons,
                        onPressed: () {
                          _onDifficultySelected(bloc, Difficult.forgot);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
