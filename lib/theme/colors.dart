import 'package:flutter/material.dart';

@immutable
class BubbleColors extends ThemeExtension<BubbleColors> {
  const BubbleColors({
    required this.bubble,
    required this.onBubble,
  });

  final Color? bubble;
  final Color? onBubble;

  @override
  BubbleColors copyWith({Color? bubble, Color? onBubble}) {
    return BubbleColors(
      bubble: bubble ?? this.bubble,
      onBubble: onBubble ?? this.onBubble,
    );
  }

  @override
  BubbleColors lerp(BubbleColors? other, double t) {
    if (other is! BubbleColors) {
      return this;
    }
    return BubbleColors(
      bubble: Color.lerp(bubble, other.bubble, t),
      onBubble: Color.lerp(onBubble, other.onBubble, t),
    );
  }

  // Optional
  @override
  String toString() => 'BubbleColors(bubble: $bubble, onBubble: $onBubble)';
}
