import 'package:dictionary_mobile/application/navigation/navigation_cubit.dart';
import 'package:dictionary_mobile/application/words_list/words_list_cubit.dart';
import 'package:dictionary_mobile/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageSelector extends StatefulWidget {
  const HomePageSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageSelector> createState() => _HomePageSelectorState();
}

class _HomePageSelectorState extends State<HomePageSelector> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final page = state.when(
          home: () => BlocConsumer<WordsListCubit, WordsListState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              state.maybeWhen(
                error: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error'),
                    ),
                  );
                },
                orElse: () {},
              );
              state.maybeWhen(
                  loaded: (words) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomePage(
                              words: words,
                            )));
                  },
                  orElse: () {});
            },
            builder: (context, state) {
              return HomePage();
            },
          ),
          history: () => Container(),
          favorites: () => Container(),
        );
        return page;
      },
    );
  }
}
