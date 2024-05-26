// ignore_for_file: public_member_api_docs, sort_constructors_first
class Phonetic {
  final String text;
  final String audio;

  Phonetic({required this.text, required this.audio});

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'] ?? '',
      audio: json['audio'] ?? '',
    );
  }

  @override
  String toString() => 'Phonetic(text: $text, audio: $audio)';
}
