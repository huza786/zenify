import 'package:zenify/screens/AuthenticationScreens/forgot_password.dart';
import 'package:zenify/screens/AuthenticationScreens/login.dart';
import 'package:zenify/screens/AuthenticationScreens/signup.dart';
import 'package:zenify/screens/MainScreens/Mainpages/main1.dart';
import 'package:zenify/screens/MainScreens/Mainpages/main2.dart';
import 'package:zenify/screens/home_page.dart';

class AppRoutes {
  static const initialRoute = '/';
  static const home = '/home';
  static const login = '/login';
  static const signUp = '/signup';
  static const forgotPassword = '/forgotpassword';
  static const homeOne = '/homeone';
  static const hometwo = '/hometwo';
}

var routes = {
  AppRoutes.initialRoute: (context) => const NavBarPage(),
  AppRoutes.login: (context) => const LogIn(),
  AppRoutes.signUp: (context) => const SignUp(),
  AppRoutes.forgotPassword: (context) => const ForgotPassword(),
  AppRoutes.homeOne: (context) => const HomeOne(),
  AppRoutes.hometwo: (context) => const HomeTwo(),
};
