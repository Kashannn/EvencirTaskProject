import 'package:evencirtaskproject/provider/CategoryProvider.dart';
import 'package:evencirtaskproject/provider/FavouriteProvider.dart';
import 'package:evencirtaskproject/provider/ProductsProvider.dart';
import 'package:evencirtaskproject/provider/bottomNavigationBar_controller.dart';
import 'package:evencirtaskproject/view/home_main_screen.dart';
import 'package:evencirtaskproject/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/const/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProductsProvider()),
        ChangeNotifierProvider(create: (_)=>CategoriesProvider()),
        ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarController()),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor:AppColors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
