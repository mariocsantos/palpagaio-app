import 'package:palpagaio/network/http/speech_api.dart';

class FlashcardRepository {
  final _api = Api.speech();

  Future<void> createFlashcard({
    required String term,
    required String definition,
  }) async {
    try {
      await _api.post(
        '/flashcard',
        data: {
          'term': term,
          'definition': definition,
        },
      );
    } catch (error) {
      rethrow;
    }
  }
}
