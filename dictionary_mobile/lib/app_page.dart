import 'package:dictionary_mobile/application/navigation/navigation_cubit.dart';
import 'package:dictionary_mobile/application/words_list/words_list_cubit.dart';
import 'package:dictionary_mobile/presentation/home_page_selector.dart';
import 'package:dictionary_mobile/presentation/widgets/sidebar_mobile.dart';
import 'package:dictionary_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';
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
        BlocProvider<WordsListCubit>(
          create: (context) => WordsListCubit()..loadWords(),
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
                      child: HomePageSelector(),
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
  }
}
