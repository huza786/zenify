import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/provider/nav_bar_provider.dart';
import 'package:zenify/utils/globalvariable.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<NavBarPage> {
  @override
  Widget build(BuildContext context) {
    NavBarState navBarState = Provider.of<NavBarState>(context);
    return Scaffold(
      extendBody: true,
      body: navBarState.screens[navBarState.selectedPage],
      backgroundColor: backgroundColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(27), topRight: Radius.circular(27)),
        child: BottomNavigationBar(
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(fill: 1),
          selectedLabelStyle: TextStyle(
            color: primaryRed,
          ),
          unselectedLabelStyle: TextStyle(color: backgroundColor),
          unselectedItemColor: backgroundColor,
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
