import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? _words;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  Future<void> _loadWords() async {
    String jsonString =
        await rootBundle.loadString('assets/words_dictionary.json');
    setState(() {
      _words = json.decode(jsonString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Words Grid"),
      ),
      body: _words == null
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 140,
                mainAxisExtent: 92,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: _words!.length,
              itemBuilder: (context, index) {
                String word = _words!.keys.elementAt(index);
                return Card(
                  child: Center(child: Text(word)),
                );
              },
            ),
    );
  }
}
