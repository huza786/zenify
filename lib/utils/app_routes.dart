import 'package:zenify/screens/AuthenticationScreens/forgot_password.dart';
import 'package:zenify/screens/AuthenticationScreens/login.dart';
import 'package:zenify/screens/AuthenticationScreens/signup.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/home1.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/home2.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/rating_page.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/filters/brands_filter.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/filters/filters_page.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/women_category.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/product_page.dart';
import 'package:zenify/screens/nav_bar_page.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const home = '/home';
  static const login = '/login';
  static const signUp = '/signup';
  static const forgotPassword = '/forgotpassword';
  static const homeOne = '/homeone';
  static const hometwo = '/hometwo';
  static const womencategory = '/womencategory';
  static const filersPage = '/filterspage';
  static const brandsFiltersPage = '/brandsfilterspage';
  static const productPage = '/productpage';
  static const ratingPage = '/ratingpage';
}

var routes = {
  AppRoutes.initialRoute: (context) => const NavBarPage(),
  AppRoutes.login: (context) => const LogIn(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.forgotPassword: (context) => const ForgotPassword(),
  AppRoutes.homeOne: (context) => const HomeOne(),
  AppRoutes.hometwo: (context) => const HomeTwo(),
  AppRoutes.womencategory: (context) => const WomenCategories(),
  AppRoutes.filersPage: (context) => const FiltersPage(),
  AppRoutes.brandsFiltersPage: (context) => const BrandsFiltersPage(),
  AppRoutes.productPage: (context) => const ProductPage(),
  AppRoutes.ratingPage: (context) => const RatingPage(),
};
