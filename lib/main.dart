import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/providers/background_nav_bar_provider.dart';
import 'package:zenify/providers/email_validation_provider.dart';
import 'package:zenify/screens/AuthenticationScreens/forgot_password.dart';
import 'package:zenify/screens/MainScreens/Mainpages/main1.dart';
import 'package:zenify/screens/AuthenticationScreens/login.dart';
import 'package:zenify/screens/AuthenticationScreens/signup.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            //email validation provider
            create: (context) => EmailState(),
          ),
          //navbar provider
          ChangeNotifierProvider(
            create: (context) => NavBarState(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: backgroundColor, useMaterial3: false),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: routes,
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
