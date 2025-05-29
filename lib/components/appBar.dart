import 'package:evencirtaskproject/core/const/app_color.dart';
import 'package:flutter/material.dart';


import '../core/theme/app_text_style.dart';

// Custom App Bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBack;
  final Function()? onBackTap;


  const CustomAppBar({
    Key? key,
    required this.title,
    this.isBack = false,
    this.onBackTap,

  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style:playfairDisplay24600.copyWith(
          color: AppColors.primaryDark
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: isBack!
          ? IconButton(
        onPressed: onBackTap,
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
        ),
      )
          : null,
    );
  }
}