import 'dart:async';

import 'package:evencirtaskproject/core/const/responsive_layout.dart';
import 'package:flutter/material.dart';
import '../core/const/app_color.dart';
import '../core/const/app_images.dart';
import '../core/theme/app_text_style.dart';
import 'home_main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay transition to home screen
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeMainScreen()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: context.screenWidth,
            height: context.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: context.screenWidth,
            height: context.screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.primaryDark.withOpacity(0.0),
                  AppColors.primaryDark,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: context.screenHeight * 0.09,
                bottom: context.screenHeight * 0.2,
              ),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('My Store', style: playfairDisplay50400),
                  ),
                  Text(
                    'Valkommen',
                    style: poppins14600.copyWith(color: AppColors.white),
                  ),
                  Text(
                    'Hos ass kan du baka tid has nastan alla \n Sveriges salonger och motagningar. Baka\n frisor, massage, skonhetsbehandingar,\n friskvard och mycket mer.',
                    style: poppins12400.copyWith(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
