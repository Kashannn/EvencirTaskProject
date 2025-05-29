import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/const/app_color.dart';
import '../provider/bottomNavigationBar_controller.dart';
import '../widgets/CustomBottomNavigationBar.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreen();
}

class _HomeMainScreen extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarController>(
      builder: (context, bottomNavController, child) {
        return WillPopScope(
          onWillPop: () async => bottomNavController.onWillPop(),
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: bottomNavController.pageController,
                      onPageChanged: (index) {
                        bottomNavController.changeIndex(index);
                      },
                      children: bottomNavController.screens,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: CustomBottomNavigationBarWithSVG(
                selectedIndex: bottomNavController.selectedIndex,
                onTap: (index) {
                  bottomNavController.changeIndex(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

