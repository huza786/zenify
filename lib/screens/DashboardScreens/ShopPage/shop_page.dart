import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/women_shop.dart';
import 'package:zenify/utils/globalvariable.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(),
            backgroundColor: Colors.white,
            bottom: TabBar(
                unselectedLabelStyle: headerStyle.copyWith(
                  fontSize: 16,
                ),
                dividerColor: Colors.white,
                indicatorColor: primaryRed,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.h,
                labelColor: Colors.black,
                labelStyle: headerStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(
                    text: 'Women',
                  ),
                  Tab(
                    text: 'Men',
                  ),
                  Tab(
                    text: 'Kids',
                  ),
                ]),
            title: Text(
              'Categories',
              style: headerStyle.copyWith(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              SingleChildScrollView(child: WomenShopPage()),
              SingleChildScrollView(child: WomenShopPage()),
              SingleChildScrollView(child: WomenShopPage()),
            ],
          )),
    );
  }
}
