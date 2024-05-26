import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_failure.freezed.dart';

@freezed
class WordFailure with _$WordFailure {
  const factory WordFailure.serverError() = WordServerError;
}
