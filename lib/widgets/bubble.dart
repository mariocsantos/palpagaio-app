import 'package:flutter/material.dart';
import 'package:palpagaio/theme/colors.dart';

/// A bubble widget that can be positioned in any corner of the parent widget.
/// The bubble component needs a Stack widget to be positioned correctly.
class Bubble extends StatelessWidget {
  const Bubble({
    super.key,
    required this.size,
    this.color,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  final double size;
  final Color? color;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    final bubbleColor =
        color ?? Theme.of(context).extension<BubbleColors>()?.bubble;

    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(size),
        ),
      ),
    );
  }
}
