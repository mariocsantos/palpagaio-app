import 'package:flashlight/features/study_session/domain/difficult.dart';
import 'package:flashlight/features/study_session/domain/study_flashcard.dart';
import 'package:flashlight/network/http/speech_api.dart';

class StudySessionRepository {
  final _api = Api.speech();

  Future<List<StudyFlashcard>> getStudySession() async {
    try {
      final response = await _api.get('/flashcard/to-review');
      final cards = (response.data?['cards'] ?? []) as List;

      if (cards.isEmpty) {
        return [];
      }

      return cards.map((card) => StudyFlashcard.fromJson(card)).toList();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> reviewCard(String cardId, Difficult difficult) async {
    try {
      await _api.put(
        '/flashcard/$cardId/review',
        data: {
          'difficult': difficult.name,
        },
      );
    } catch (error) {
      rethrow;
    }
  }
}
