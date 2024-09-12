import 'package:palpagaio/features/flashcard/presentation/widgets/flashcard_audio.dart';
import 'package:flutter/material.dart';
import 'package:palpagaio/widgets/bubble.dart';

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

    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: isFront ? colorScheme.surface : colorScheme.primary,
          ),
          child: Stack(
            children: [
              Bubble(
                size: 600,
                top: -400,
                left: -300,
                color: (isFront ? colorScheme.surfaceContainer : null),
              ),
              Bubble(
                size: 300,
                bottom: -150,
                right: -150,
                color: (isFront ? colorScheme.surfaceContainer : null),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isFront
                          ? colorScheme.onSurface
                          : colorScheme.onPrimary,
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
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
