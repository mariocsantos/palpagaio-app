import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;

  const FlipCard({super.key, required this.front, required this.back});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;

  Widget __buildLayout({required Key key, required Widget child}) {
    return Container(
      key: key,
      child: child,
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      child: widget.front,
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: const ValueKey(false),
      child: widget.back,
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showFrontSide = !_showFrontSide),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        transitionBuilder: _transitionBuilder,
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }
}
