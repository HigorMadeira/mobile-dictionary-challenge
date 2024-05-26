import 'package:dictionary_backend/words/i_words_datasource.dart';
import 'package:dictionary_dependencies_core/dictionary_dependencies_core.dart';
import 'package:dictionary_domain/dictionary_domain.dart';

class WordsRepository implements IWordsRepository {
  final IWordsDatasource datasource;

  WordsRepository(this.datasource);

  @override
  Future<Either<WordFailure, WordData>> fetchWordData(String word) async {
    try {
      final wordData = await datasource.fetchWordData(word);
      return Right(wordData);
    } on WordFailure catch (e) {
      return Left(e);
    }
  }
}
