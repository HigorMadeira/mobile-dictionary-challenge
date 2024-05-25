import 'package:dictionary_mobile/application/navigation/navigation_cubit.dart';
import 'package:dictionary_mobile/presentation/widgets/menu_item_mobile.dart';
import 'package:dictionary_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarMobile extends StatelessWidget {
  const SideBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isTablet = size.width > 860;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      width: isTablet ? 74 : 56,
      color: AppColors.primaryBlue,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColors.primaryBlue,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MenuItemMobile(
                      isTablet: isTablet,
                      text: 'Grid',
                      icon: Icons.assignment_outlined,
                      isSelected: context.select((NavigationCubit c) =>
                          c.state == const NavigationState.home()),
                      onTap: () => context.read<NavigationCubit>().goToHome(),
                    ),
                    MenuItemMobile(
                      isTablet: isTablet,
                      text: 'History',
                      icon: Icons.assignment_outlined,
                      isSelected: context.select((NavigationCubit c) =>
                          c.state == const NavigationState.history()),
                      onTap: () =>
                          context.read<NavigationCubit>().goToHistory(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
