import 'package:dictionary_mobile/theme/app_colors.dart';
import 'package:dictionary_mobile/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MenuItemMobile extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isTablet;
  const MenuItemMobile({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.isTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            color: AppColors.primaryBlue,
            margin: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: isSelected
                      ? AppColors.accentOrangeLighter
                      : AppColors.blue50.withOpacity(0.4),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (isSelected)
                  Text(
                    text,
                    style: TextStyles.menuItem,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
