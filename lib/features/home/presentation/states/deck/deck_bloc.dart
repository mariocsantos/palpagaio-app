import 'package:palpagaio/features/home/data/deck_repository.dart';
import 'package:palpagaio/features/home/presentation/states/deck/deck_events.dart';
import 'package:palpagaio/features/home/presentation/states/deck/deck_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeckBloc extends Bloc<DeckEvent, DeckState> {
  DeckBloc({
    required DeckRepository deckRepository,
  })  : _repository = deckRepository,
        super(const DeckState()) {
    on<DeckFetch>(_onDeckFetch);
  }

  final DeckRepository _repository;

  _onDeckFetch(DeckFetch event, Emitter<DeckState> emit) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        error: null,
      ));

      final deck = await _repository.getDeck();

      emit(state.copyWith(
        isLoading: false,
        error: null,
        deck: deck,
      ));
    } catch (error) {
      emit(state.copyWith(
        isLoading: false,
        error: error,
        deck: null,
      ));
    }
  }
}
