import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class HomeOne extends StatefulWidget {
  const HomeOne({super.key});

  @override
  State<HomeOne> createState() => _HomeOneState();
}

class _HomeOneState extends State<HomeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //Main Poster
          Stack(
            children: [
              Image.asset(
                'assets/images/BigBanner.png',
                height: 536.h,
                width: 376.w,
                fit: BoxFit.cover,
              ),
              //Text Fashion sale
              Positioned(
                top: 354.h,
                left: 15.w,
                child: Text(
                  'Fashion\nSale',
                  style: headerStyle.copyWith(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
              ),
              //check button
              Positioned(
                  top: 468.h,
                  left: 10.w,
                  child: TextButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all<Size>(Size(160.h, 36.h)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.red))),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryRed)),
                    child: Text(
                      'Check',
                      style: headerStyle.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.hometwo);
                    },
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        (569 - 536).w,
                        0,
                        0,
                      ),
                      child: Text(
                        'New',
                        style: headerStyle.copyWith(
                            fontSize: 34, fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: Text(
                        """You've never seen it before!""",
                        style: headerStyle.copyWith(
                            fontSize: 11, color: const Color(0xff9B9B9B)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 26.h, 0, 0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: headerStyle.copyWith(
                          fontSize: 11, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 260.w,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          ProductCard(
                            title: 'T-Shirt Sailing',
                            subTitle: 'Mango Boy',
                            orignalPrice: 39.99,
                            salePrice: 19.99,
                            favoriteOrNot: false,
                            newOrNot: false,
                          )),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
