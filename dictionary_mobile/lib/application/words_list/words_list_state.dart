part of 'words_list_cubit.dart';

@freezed
class WordsListState with _$WordsListState {
  const factory WordsListState.initial() = _Initial;
  const factory WordsListState.loading() = _Loading;
  const factory WordsListState.error() = _Error;
  const factory WordsListState.loaded(Map<String, dynamic>? words) = _Loaded;
}
