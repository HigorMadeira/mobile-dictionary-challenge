import 'package:dartz/dartz.dart';
import 'package:dictionary_domain/dictionary_domain.dart';

abstract class IWordsRepository {
  Future<Either<WordFailure, WordData>> fetchWordData(String word);
}
