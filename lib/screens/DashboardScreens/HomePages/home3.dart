import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/utils/globalvariable.dart';

class HomeThree extends StatefulWidget {
  const HomeThree({super.key});

  @override
  State<HomeThree> createState() => _HomeThreeState();
}

class _HomeThreeState extends State<HomeThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              banner,
              height: 196.h,
              width: 376.w,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: 140.h,
                left: 21.w,
                child: Text(
                  'Street Clothes',
                  style: headerStyle.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                )),
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
                      'Sale',
                      style: headerStyle.copyWith(
                          fontSize: 34, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Text(
                      """New Summer Sale""",
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
                    style:
                        headerStyle.copyWith(fontSize: 11, color: Colors.black),
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
                //sale items
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      // Access each product map in the list
                      Product currentProduct = productList[index];
                      return Visibility(
                        visible: !currentProduct.newOrNot,
                        child: ProductCard(
                          initRating: currentProduct.initRating,
                          productImage: currentProduct.productImage,
                          title: currentProduct.title,
                          subTitle: currentProduct.subTitle,
                          orignalPrice: currentProduct.originalPrice,
                          salePrice: currentProduct.salePrice,
                          favoriteOrNot: currentProduct.favoriteOrNot,
                          newOrNot: currentProduct.newOrNot,
                        ),
                      );
                    }),
              ),
            )
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
                    style:
                        headerStyle.copyWith(fontSize: 11, color: Colors.black),
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
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      // Access each product map in the list
                      Product currentProduct = productList[index];
                      return Visibility(
                        visible: currentProduct.newOrNot,
                        child: ProductCard(
                          initRating: currentProduct.initRating,
                          productImage: currentProduct.productImage,
                          title: currentProduct.title,
                          subTitle: currentProduct.subTitle,
                          orignalPrice: currentProduct.originalPrice,
                          salePrice: currentProduct.salePrice,
                          favoriteOrNot: currentProduct.favoriteOrNot,
                          newOrNot: currentProduct.newOrNot,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
        SizedBox(
          height: 100.h,
        )
      ],
    );
  }
}
