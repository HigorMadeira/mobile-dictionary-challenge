import 'package:dictionary_mobile/application/words_list/words_list_cubit.dart';
import 'package:dictionary_mobile/presentation/word_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordsList extends StatelessWidget {
  const WordsList({super.key, this.words});
  final Map<String, dynamic>? words;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 140,
        mainAxisExtent: 92,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: words!.length,
      itemBuilder: (context, index) {
        String word = words!.keys.elementAt(index);
        return InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () async {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            final result = await context.read<WordsListCubit>().getWord(word);

            if (result.word.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Could not find word data.'),
                ),
              );
            } else {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return WordInfo(
                  word: result.word,
                  phonetic: result.phonetic,
                  meanings: result.meanings,
                );
              }));
            }
          },
          child: Card(
            child: Center(child: Text(word)),
          ),
        );
      },
    );
  }
}
