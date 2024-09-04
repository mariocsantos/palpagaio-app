import 'package:flashlight/features/home/domain/deck.dart';
import 'package:flashlight/network/http/speech_api.dart';

class DeckRepository {
  final _api = Api.speech();

  Future<Deck> getDeck() async {
    try {
      final response = await _api.get('/flashcard/dashboard');
      return Deck.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
