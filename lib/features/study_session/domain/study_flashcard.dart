import 'package:equatable/equatable.dart';

class StudyFlashcard extends Equatable {
  final String id;
  final String term;
  final String definition;
  final String audioUrl;
  final String nextReview;

  const StudyFlashcard({
    required this.id,
    required this.term,
    required this.definition,
    required this.audioUrl,
    required this.nextReview,
  });

  @override
  List<Object> get props => [id, term, definition, audioUrl, nextReview];

  factory StudyFlashcard.fromJson(Map<String, dynamic> json) {
    return StudyFlashcard(
      id: json['id'] as String,
      term: json['term'] as String,
      definition: json['definition'] as String,
      audioUrl: json['audioUrl'] as String,
      nextReview: json['nextReview'] as String,
    );
  }
}
