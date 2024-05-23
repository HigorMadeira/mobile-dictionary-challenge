import 'package:dictionary_mobile/words_list.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  Map<String, dynamic>? _words;
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Words Grid"),
        ),
        body: _words == null
            ? const Center(child: CircularProgressIndicator())
            : PageView(
                controller: pageController,
                children: [
                  WordsList(words: _words!),
                  Container(
                    color: Colors.blue,
                    child: const Center(child: Text("Page 2")),
                  )
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
              pageController.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_on),
              label: "Grid",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List",
            ),
          ],
        ));
  }
}
