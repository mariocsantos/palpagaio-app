import 'package:flashlight/features/study_session/domain/difficult.dart';

abstract class StudySessionEvents {}

class StudySessionStarted extends StudySessionEvents {}

class StudySessionCardReviewed extends StudySessionEvents {
  final Difficult difficult;

  StudySessionCardReviewed({
    required this.difficult,
  });
}
