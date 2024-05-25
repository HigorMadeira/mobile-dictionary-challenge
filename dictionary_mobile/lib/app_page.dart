import 'dart:convert';

import 'package:dictionary_mobile/application/navigation/navigation_cubit.dart';
import 'package:dictionary_mobile/presentation/home_page_selector.dart';
import 'package:dictionary_mobile/presentation/widgets/sidebar_mobile.dart';
import 'package:dictionary_mobile/presentation/widgets/words_list.dart';
import 'package:dictionary_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPAge extends StatelessWidget {
  const AppPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: const MaterialApp(
        home: AppView(),
      ),
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
      body: Container(
        color: AppColors.chili,
        child: Stack(
          children: [
            Expanded(
              child: Container(
                color: AppColors.whiteElevations.shade200,
                child: Column(
                  children: [
                    Expanded(
                      child: HomePageSelector(
                        words: _words!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 64,
                  child: SideBarMobile(),
                  width: double.infinity,
                ),
              ],
            )
          ],
        ),
      ),
    );

    Scaffold(
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
