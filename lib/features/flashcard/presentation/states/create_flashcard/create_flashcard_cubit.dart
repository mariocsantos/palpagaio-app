import 'package:palpagaio/features/flashcard/data/flashcard_repository.dart';
import 'package:palpagaio/features/flashcard/presentation/states/create_flashcard/create_flashcard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFlashcardCubit extends Cubit<CreateFlashcardState> {
  CreateFlashcardCubit({
    required FlashcardRepository flashcardRepository,
  })  : _repository = flashcardRepository,
        super(const CreateFlashcardState());

  final FlashcardRepository _repository;

  void termChanged(String term) {
    emit(state.copyWith(term: term));
  }

  void definitionChanged(String definition) {
    emit(state.copyWith(definition: definition));
  }

  Future<void> submit() async {
    try {
      emit(state.copyWith(isSubmitting: true));

      await _repository.createFlashcard(
        term: state.term,
        definition: state.definition,
      );
    } catch (error) {
      rethrow;
    } finally {
      emit(state.copyWith(
        isSubmitting: false,
      ));
    }
  }
}
