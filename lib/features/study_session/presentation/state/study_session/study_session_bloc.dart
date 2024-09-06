import 'package:flashlight/features/study_session/data/study_session_repository.dart';
import 'package:flashlight/features/study_session/presentation/state/study_session/study_session_events.dart';
import 'package:flashlight/features/study_session/presentation/state/study_session/study_session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudySessionBloc extends Bloc<StudySessionEvents, StudySessionState> {
  StudySessionBloc({
    required StudySessionRepository studySessionRepository,
  })  : _repository = studySessionRepository,
        super(const StudySessionState()) {
    on<StudySessionStarted>(_onStudySessionStarted);
    on<StudySessionCardReviewed>(_onStudySessionCardReviewed);
  }

  final StudySessionRepository _repository;

  _onStudySessionStarted(
      StudySessionStarted event, Emitter<StudySessionState> emit) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        errorMessage: '',
        isCompleted: false,
      ));

      final cards = await _repository.getStudySession();

      emit(state.copyWith(
        cards: cards,
        currentIndex: 0,
        isLoading: false,
        errorMessage: '',
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Ops! Something went wrong. Please try again.',
      ));
    }
  }

  _onStudySessionCardReviewed(
      StudySessionCardReviewed event, Emitter<StudySessionState> emit) async {
    try {
      emit(state.copyWith(
        isReviewing: true,
      ));

      final card = state.cards[state.currentIndex];
      final difficult = event.difficult;

      await _repository.reviewCard(card.id, difficult);

      final isLastCard = state.currentIndex == state.cards.length - 1;

      if (isLastCard) {
        emit(state.copyWith(
          isCompleted: true,
        ));
        return;
      }

      emit(state.copyWith(
        currentIndex: state.currentIndex + 1,
        isReviewing: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: 'Ops! Something went wrong. Please try again.',
        isReviewing: false,
      ));
    }
  }
}
