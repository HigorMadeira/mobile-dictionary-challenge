import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'words_list_state.dart';
part 'words_list_cubit.freezed.dart';

class WordsListCubit extends Cubit<WordsListState> {
  WordsListCubit() : super(WordsListState.initial());

  Future<void> loadWords() async {
    emit(WordsListState.loading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      String jsonString =
          await rootBundle.loadString('assets/words_dictionary.json');

      final _words = json.decode(jsonString);

      emit(WordsListState.loaded(_words));
    } catch (e) {
      emit(WordsListState.error());
    }
  }
}
