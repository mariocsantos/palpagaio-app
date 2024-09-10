import 'package:equatable/equatable.dart';
import 'package:palpagaio/features/home/domain/deck.dart';

class DeckState extends Equatable {
  const DeckState({
    this.deck,
    this.isLoading = false,
    this.error,
  });

  final Deck? deck;
  final bool isLoading;
  final dynamic error;

  @override
  List<Object?> get props => [deck, isLoading, error];

  DeckState copyWith({
    Deck? deck,
    bool? isLoading,
    dynamic error,
  }) {
    return DeckState(
      deck: deck ?? this.deck,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
