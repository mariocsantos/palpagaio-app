import 'package:palpagaio/features/home/domain/deck.dart';
import 'package:flutter/material.dart';
import 'package:palpagaio/widgets/bubble.dart';

class DeckCard extends StatelessWidget {
  const DeckCard({
    super.key,
    required this.deck,
    required this.onTap,
  });

  final Deck deck;
  final Function(Deck) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onPrimary;

    return GestureDetector(
      onTap: () => onTap(deck),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onTap: () => onTap(deck),
            child: Stack(
              children: [
                const Bubble(
                  size: 100,
                  top: -50,
                  right: -30,
                ),
                const Bubble(
                  size: 300,
                  right: -40,
                  bottom: -250,
                ),
                const Bubble(
                  size: 50,
                  left: -10,
                  top: -10,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            deck.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    deck.cardsToReview.toString(),
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'to study',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 24),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    deck.totalCards.toString(),
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
