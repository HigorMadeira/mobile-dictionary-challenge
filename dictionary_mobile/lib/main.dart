import 'package:dictionary_backend/words/i_words_datasource.dart';
import 'package:dictionary_backend/words/words_datasource.dart';
import 'package:dictionary_backend/words/words_repository.dart';
import 'package:dictionary_domain/dictionary_domain.dart';
import 'package:dictionary_mobile/app_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IWordsDatasource>(
          create: (context) => WordsDataSource(),
        ),
        RepositoryProvider<IWordsRepository>(
          create: (context) => WordsRepository(
            context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        home: AppPAge(),
      ),
    );
  }
}
