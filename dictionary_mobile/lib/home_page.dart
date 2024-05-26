import 'package:dictionary_mobile/presentation/widgets/words_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.words});
  final Map<String, dynamic>? words;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Words List"),
      ),
      body: words == null
          ? const Center(child: CircularProgressIndicator())
          : WordsList(words: words!),
    );
  }
}
