import 'package:dictionary_domain/dictionary_domain.dart';
import 'package:dictionary_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/display.dart';

class WordInfo extends StatelessWidget {
  const WordInfo(
      {super.key,
      required this.word,
      required this.phonetic,
      required this.meanings});
  final String word;
  final String phonetic;
  final List<Meaning> meanings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Display(
            word: word,
            phonetic: phonetic,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Meanings',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: AppColors.offBlack,
                    fontSize: 32,
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: meanings.length,
              itemBuilder: (context, index) {
                final meaning = meanings[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meaning.partOfSpeech,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.offBlack,
                        fontSize: 24,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...meaning.definitions.map((definition) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              definition.definition,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: AppColors.offBlack,
                                fontSize: 18,
                                height: 1.2,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (definition.example != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Example: ${definition.example}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.offBlack,
                                    fontSize: 16,
                                    height: 1.2,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            if (definition.synonyms.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Synonyms: ${definition.synonyms.join(', ')}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.offBlack,
                                    fontSize: 16,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            if (definition.antonyms.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Antonyms: ${definition.antonyms.join(', ')}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: AppColors.offBlack,
                                    fontSize: 16,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
