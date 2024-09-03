class Deck {
  const Deck({
    required this.id,
    required this.name,
    required this.totalCards,
    required this.cardsToStudy,
  });

  final String id;
  final String name;
  final int totalCards;
  final int cardsToStudy;
}
