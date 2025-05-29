import 'package:flutter/cupertino.dart';

import '../view/Categories_screen.dart';
import '../view/Favourites_screen.dart';
import '../view/product_screen.dart';
import '../view/userSettings_screen.dart';

class BottomNavigationBarController extends ChangeNotifier {
  int _selectedIndex = 0;
  late PageController pageController = PageController();

  int get selectedIndex => _selectedIndex;

  final List<Widget> screens = [
    ProductScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    UsersettingsScreen(),
  ];

  void changeIndex(int index) {
    _selectedIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }

  Future<bool> onWillPop() async {
    if (_selectedIndex != 0) {
      changeIndex(0);
      return false;
    }
    return false;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
