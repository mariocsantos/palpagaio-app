import 'package:flashlight/features/study_session/domain/difficult.dart';
import 'package:flashlight/features/study_session/domain/difficult_properties.dart';
import 'package:flutter/material.dart';

class DifficultyButton extends StatelessWidget {
  const DifficultyButton({
    super.key,
    required this.onPressed,
    required this.difficult,
  });

  final VoidCallback onPressed;
  final Difficult difficult;

  @override
  Widget build(BuildContext context) {
    final DifficultProperties properties = DifficultProperties(difficult);

    return SizedBox(
      width: 72,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
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
            properties.color,
          ),
          foregroundColor: MaterialStateProperty.all(
            properties.textColor,
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
