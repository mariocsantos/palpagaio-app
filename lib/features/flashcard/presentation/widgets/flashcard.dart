import 'package:flashlight/features/flashcard/presentation/widgets/flashcard_audio.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatelessWidget {
  const FlashCard({
    super.key,
    required this.text,
    required this.audioUrl,
    this.isFront = false,
  });

  final String text;
  final String audioUrl;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.54),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
        color: isFront
            ? colorScheme.secondaryContainer
            : colorScheme.primaryContainer,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isFront
                      ? colorScheme.onSecondaryContainer
                      : colorScheme.onSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FlashCardAudio(
              isFront: isFront,
              audioUrl: audioUrl,
            ),
          ),
          isFront
              ? Positioned(
                  bottom: 4,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Tap to show answer',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Positioned(
            top: -400,
            left: -300,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                color: (isFront
                        ? colorScheme.onSecondaryContainer
                        : colorScheme.onPrimaryContainer)
                    .withOpacity(0.06),
                borderRadius: BorderRadius.circular(600),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            right: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: (isFront
                        ? colorScheme.onSecondaryContainer
                        : colorScheme.onPrimaryContainer)
                    .withOpacity(0.06),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
