import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/home2.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/home3.dart';
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
      extendBody: true,
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
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size(160.h, 36.h)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          const BorderSide(color: Colors.red))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryRed)),
                      child: Text(
                        'Check',
                        style: headerStyle.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, AppRoutes.hometwo);
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
                    height: 300.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.builder(
                          //New Products
                          scrollDirection: Axis.horizontal,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            // Access each product map in the list
                            Product currentProduct = productList[index];
                            return Visibility(
                              visible: currentProduct.productStatus ==
                                  ProductState.newProduct,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: ProductCard(
                                  product: currentProduct,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              ],
            ),
            const HomeTwo(),
            const HomeThree(),
          ],
        ),
      ),
    );
  }
}
