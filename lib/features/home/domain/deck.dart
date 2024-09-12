import 'package:equatable/equatable.dart';

class Deck extends Equatable {
  const Deck({
    required this.id,
    required this.name,
    required this.totalCards,
    required this.cardsToReview,
  });

  final String id;
  final String name;
  final int totalCards;
  final int cardsToReview;

  @override
  List<Object?> get props => [id, name, totalCards, cardsToReview];

  @override
  factory Deck.fromJson(Map<String, dynamic> json) {
    return Deck(
      id: 'fake-id',
      name: json['deckName'] ?? '',
      totalCards: json['total'] ?? 0,
      cardsToReview: json['toReview'] ?? 0,
    );
  }
}
