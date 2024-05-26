import 'dart:convert';
import 'package:dictionary_backend/words/i_words_datasource.dart';
import 'package:dictionary_domain/dictionary_domain.dart';
import 'package:http/http.dart' as http;

class WordsDataSource implements IWordsDatasource {
  @override
  Future<WordData> fetchWordData(String word) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$word'),
      );
      print(response.toString());
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        final result =
            jsonResponse.map((data) => WordData.fromJson(data)).toList().first;
        return result;
      } else {
        print('Failed to load word data: ${response.statusCode}');
        return WordData.empty();
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load word data');
    }
  }
}
