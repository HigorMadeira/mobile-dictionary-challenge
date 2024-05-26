import 'package:dictionary_domain/dictionary_domain.dart';

abstract class IWordsDatasource {
  Future<WordData> fetchWordData(String word);
}
