import 'package:palpagaio/features/study_session/domain/difficult.dart';
import 'package:flutter/material.dart';

class DifficultProperties {
  const DifficultProperties(this.difficult);

  final Difficult difficult;

  String get text {
    switch (difficult) {
      case Difficult.easy:
        return 'Easy';
      case Difficult.regular:
        return 'Good';
      case Difficult.hard:
        return 'Hard';
      case Difficult.forgot:
        return 'Forgot';
    }
  }

  Color get color {
    switch (difficult) {
      case Difficult.easy:
        return Colors.green.shade50;
      case Difficult.regular:
        return Colors.blue.shade50;
      case Difficult.hard:
        return Colors.orange.shade50;
      case Difficult.forgot:
        return Colors.red.shade50;
    }
  }

  Color get textColor {
    switch (difficult) {
      case Difficult.easy:
        return Colors.green;
      case Difficult.regular:
        return Colors.blue;
      case Difficult.hard:
        return Colors.orange;
      case Difficult.forgot:
        return Colors.red;
    }
  }

  Color get overlayColor {
    switch (difficult) {
      case Difficult.easy:
        return Colors.green.shade100;
      case Difficult.regular:
        return Colors.blue.shade100;
      case Difficult.hard:
        return Colors.orange.shade100;
      case Difficult.forgot:
        return Colors.red.shade100;
    }
  }
}
