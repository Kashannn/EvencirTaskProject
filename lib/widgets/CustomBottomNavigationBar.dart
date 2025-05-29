import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/const/app_color.dart';
import '../core/const/app_images.dart';
import '../core/theme/app_text_style.dart';
class CustomBottomNavigationBarWithSVG extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBarWithSVG({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSVGNavItem(
            index: 0,
            iconPath: selectedIndex == 0 ? AppImages.product : AppImages.product,
            label: 'Products',
            isSelected: selectedIndex == 0,
          ),
          _buildSVGNavItem(
            index: 1,
            iconPath: selectedIndex == 1 ? AppImages.categories : AppImages.categories,
            label: 'Categories',
            isSelected: selectedIndex == 1,

          ),
          _buildSVGNavItem(
            index: 2,
            iconPath: selectedIndex == 2 ? AppImages.favourites : AppImages.favourites,
            label: 'Favourites',
            isSelected: selectedIndex == 2,
          ),
          _buildSVGNavItem(
            index: 3,
            iconPath: selectedIndex == 3 ? AppImages.person : AppImages.person,
            label: 'Mitt konto',
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
  Widget _buildSVGNavItem({
    required int index,
    required String iconPath,
    required String label,
    required bool isSelected,
    bool showBadge = false,
    int badgeCount = 0,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightWhite.withOpacity(0.10) : Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 24,
                  height: 24,
                ),
                if (showBadge && badgeCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        badgeCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: poppins10400.copyWith(
                color: isSelected ? AppColors.white : AppColors.lightWhite,
              )
            ),
          ],
        ),
      ),
    );
  }
}