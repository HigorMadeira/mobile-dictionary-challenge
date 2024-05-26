// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dictionary_domain/dictionary_domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class WordData {
  final String word;
  final String phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final License license;
  final List<String> sourceUrls;

  WordData({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });
  factory WordData.empty() {
    return WordData(
      word: '',
      phonetic: '',
      phonetics: [],
      meanings: [],
      license: License(name: '', url: ''),
      sourceUrls: [],
    );
  }
  factory WordData.fromJson(Map<String, dynamic> json) {
    return WordData(
      word: json['word'] ?? '',
      phonetic: json['phonetic'] ?? '',
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((item) => Phonetic.fromJson(item))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>)
          .map((item) => Meaning.fromJson(item))
          .toList(),
      license: License.fromJson(json['license']),
      sourceUrls: List<String>.from(json['sourceUrls']),
    );
  }

  @override
  String toString() {
    return 'WordData(word: $word, phonetic: $phonetic, phonetics: $phonetics, meanings: $meanings, license: $license, sourceUrls: $sourceUrls)';
  }

  @override
  bool operator ==(covariant WordData other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.word == word &&
        other.phonetic == phonetic &&
        listEquals(other.phonetics, phonetics) &&
        listEquals(other.meanings, meanings) &&
        other.license == license &&
        listEquals(other.sourceUrls, sourceUrls);
  }

  @override
  int get hashCode {
    return word.hashCode ^
        phonetic.hashCode ^
        phonetics.hashCode ^
        meanings.hashCode ^
        license.hashCode ^
        sourceUrls.hashCode;
  }
}
