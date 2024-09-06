import 'package:flashlight/features/study_session/domain/difficult.dart';
import 'package:flashlight/features/study_session/domain/difficult_properties.dart';
import 'package:flutter/material.dart';

class DifficultyButton extends StatelessWidget {
  const DifficultyButton({
    super.key,
    required this.onPressed,
    required this.difficult,
    this.disabled = false,
  });

  final VoidCallback? onPressed;
  final Difficult difficult;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final DifficultProperties properties = DifficultProperties(difficult);
    final Color disabledColor = Theme.of(context).disabledColor;

    return SizedBox(
      width: 72,
      height: 54,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(
            disabled ? disabledColor.withOpacity(0.1) : properties.color,
          ),
          foregroundColor: MaterialStateProperty.all(
            disabled ? disabledColor : properties.textColor,
          ),
        ),
        child: Text(
          properties.text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
