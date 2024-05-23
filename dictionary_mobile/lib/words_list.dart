import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  const WordsList({super.key, this.words});
  final Map<String, dynamic>? words;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 140,
        mainAxisExtent: 92,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: words!.length,
      itemBuilder: (context, index) {
        String word = words!.keys.elementAt(index);
        return Card(
          child: Center(child: Text(word)),
        );
      },
    );
  }
}
