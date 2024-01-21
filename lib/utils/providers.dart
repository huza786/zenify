import 'package:provider/provider.dart';
import 'package:zenify/screens/AuthenticationScreens/providers/email_validation_provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/screens/DashboardScreens/provider/nav_bar_provider.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';

List<ChangeNotifierProvider> providers = [
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
];
