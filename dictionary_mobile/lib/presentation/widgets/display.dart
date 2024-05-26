import 'package:dictionary_mobile/theme/text_styles.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({super.key, required this.word, required this.phonetic});
  final String word;
  final String phonetic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Expanded(
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 208, 223),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  word,
                  style: TextStyles.titleStyle,
                ),
                SizedBox(height: 8),
                Text(
                  phonetic,
                  style: TextStyles.titleStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
