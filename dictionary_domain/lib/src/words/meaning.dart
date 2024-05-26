// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dictionary_domain/src/words/definition.dart';

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json['partOfSpeech'] ?? '',
      definitions: (json['definitions'] as List<dynamic>)
          .map((item) => Definition.fromJson(item))
          .toList(),
    );
  }

  @override
  String toString() =>
      'Meaning(partOfSpeech: $partOfSpeech, definitions: $definitions)';
}
