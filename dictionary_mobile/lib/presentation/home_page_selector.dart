import 'package:dictionary_mobile/application/navigation/navigation_cubit.dart';
import 'package:dictionary_mobile/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageSelector extends StatelessWidget {
  const HomePageSelector({Key? key, required this.words}) : super(key: key);
  final Map<String, dynamic> words;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final page = state.when(
          home: () => HomePage(
            words: words,
          ),
          history: () => Container(),
          favorites: () => Container(),
        );
        return page;
      },
    );
  }
}
