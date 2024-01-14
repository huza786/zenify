import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            systemOverlayStyle: SystemUiOverlayStyle(),
            backgroundColor: Colors.white,
            bottom: TabBar(
                indicatorColor: primaryRed,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.h,
                labelColor: primaryRed,
                labelStyle: headerStyle.copyWith(fontSize: 16),
                tabs: [
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
          body: TabBarView(
            children: [
              Center(
                child: Text(
                  'Women',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Men',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  'Children',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
