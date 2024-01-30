import 'package:flutter/material.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/home1.dart';
import 'package:zenify/screens/DashboardScreens/FavoriteScreens/favorites_page.dart';
import 'package:zenify/screens/DashboardScreens/profile_page.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/shop_page.dart';
import 'package:zenify/screens/DashboardScreens/shopping_cart_page.dart';

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
