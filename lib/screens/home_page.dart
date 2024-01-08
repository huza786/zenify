import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenify/providers/background_nav_bar_provider.dart';
import 'package:zenify/utils/globalvariable.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    NavBarState navBarState = Provider.of<NavBarState>(context);
    return Scaffold(
      body: navBarState.screens[navBarState.selectedPage],
      backgroundColor: backgroundColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(fill: 1),
          selectedLabelStyle: TextStyle(
            color: primaryRed,
          ),
          unselectedLabelStyle: TextStyle(color: greyColor),
          unselectedItemColor: greyColor,
          selectedItemColor: primaryRed,
          currentIndex: navBarState.selectedPage,
          onTap: (index) {
            navBarState.selectPage = index;
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: primaryRed,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                label: 'Shop',
                activeIcon: Icon(
                  Icons.shopping_cart,
                  color: primaryRed,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                label: 'Bag',
                activeIcon: Icon(
                  Icons.shopping_bag,
                  color: primaryRed,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_outline),
                label: 'Favorite',
                activeIcon: Icon(
                  Icons.favorite,
                  color: primaryRed,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_outlined),
                label: 'Account',
                activeIcon: Icon(
                  Icons.account_circle,
                  color: primaryRed,
                )),
          ],
        ),
      ),
    );
  }
}
