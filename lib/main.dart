import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/AuthenticationScreens/providers/email_validation_provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/expandable_model_and_provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/screens/DashboardScreens/provider/nav_bar_provider.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
          ),
          //provider for product card
          ChangeNotifierProvider(
            create: (context) => ProductCardState(),
          ),
          //provider for filter page
          ChangeNotifierProvider(
            create: (context) => FilterProvider(),
          ),
          //provider for product page
          ChangeNotifierProvider(
            create: (context) => ProductPageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExpandedCardProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  centerTitle: true, iconTheme: IconThemeData()),
              scaffoldBackgroundColor: backgroundColor,
              useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: routes,
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
