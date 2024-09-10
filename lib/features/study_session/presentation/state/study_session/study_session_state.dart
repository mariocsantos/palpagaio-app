import 'package:equatable/equatable.dart';
import 'package:palpagaio/features/study_session/domain/study_flashcard.dart';

class StudySessionState extends Equatable {
  final List<StudyFlashcard> cards;
  final int currentIndex;
  final bool isLoading;
  final bool isCompleted;
  final bool isReviewing;
  final String errorMessage;

  const StudySessionState({
    this.cards = const [],
    this.currentIndex = 0,
    this.isLoading = false,
    this.isCompleted = false,
    this.isReviewing = false,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [
        cards,
        currentIndex,
        isLoading,
        isCompleted,
        isReviewing,
        errorMessage,
      ];

  StudySessionState copyWith({
    List<StudyFlashcard>? cards,
    int? currentIndex,
    bool? isLoading,
    bool? isCompleted,
    bool? isReviewing,
    String? errorMessage,
  }) {
    return StudySessionState(
      cards: cards ?? this.cards,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
      isReviewing: isReviewing ?? this.isReviewing,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
