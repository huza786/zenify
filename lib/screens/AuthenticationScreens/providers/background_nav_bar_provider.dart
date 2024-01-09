import 'package:flutter/material.dart';
import 'package:zenify/screens/MainScreens/Mainpages/main1.dart';
import 'package:zenify/screens/MainScreens/favorites_page.dart';
import 'package:zenify/screens/MainScreens/Mainpages/main2.dart';
import 'package:zenify/screens/MainScreens/profile_page.dart';
import 'package:zenify/screens/MainScreens/shop_page.dart';
import 'package:zenify/screens/MainScreens/shopping_cart_page.dart';
import 'package:zenify/screens/home_page.dart';

class NavBarState with ChangeNotifier {
  var homeIndex = 0;
  int _selectedPage = 0;
  List<Widget> screens = [
    const HomeOne(),
    const ShopPage(),
    const ShoppingCart(),
    const FavoritesPage(),
    const ProfilePage()
  ];
  // Widget CheckCurrentHomePage() {
  //   switch (homeIndex) {
  //     case 0:
  //       return const HomeOne();
  //     case 1:
  //       return const HomeTwo();
  //       case 2:
  //       return

  //       break;
  //     default:
  //   }
  // }

  get selectedPage => _selectedPage;
  get currentScreen => screens[selectedPage];
  set selectPage(int index) {
    _selectedPage = index;
    notifyListeners();
  }
}
