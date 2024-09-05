import 'package:equatable/equatable.dart';

class CreateFlashcardState extends Equatable {
  final String term;
  final String definition;
  final bool isSubmitting;

  const CreateFlashcardState({
    this.term = '',
    this.definition = '',
    this.isSubmitting = false,
  });

  get canSubmit => term.isNotEmpty && definition.isNotEmpty;

  @override
  List<Object?> get props => [
        term,
        definition,
        isSubmitting,
      ];

  CreateFlashcardState copyWith({
    String? term,
    String? definition,
    bool? isSubmitting,
  }) {
    return CreateFlashcardState(
      term: term ?? this.term,
      definition: definition ?? this.definition,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
