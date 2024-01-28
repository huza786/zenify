// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_line_progress.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_pyramid.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';
import 'package:zenify/utils/globalvariable.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  bool photosOrNot = false;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    productPageProvider.showStarsIntValue(product.reviews);
    productPageProvider.showAverageNumber(product.reviews);
  }

  @override
  Widget build(BuildContext context) {
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    // final Product product =
    //     ModalRoute.of(context)!.settings.arguments as Product;
    // // final averageNumber =
    // //     productPageProvider.showAverageNumber(product.reviews);
    // productPageProvider.showStarsIntValue(product.reviews);
    // productPageProvider.showAverageNumber(product.reviews);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          //Adding share button
          Icon(Icons.share)
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        // title: Text(
        //   'Rating',
        //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 18.h,
                  ),
                  child: Text(
                    'Rating&Reviews',
                    style: headerStyle.copyWith(
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                //Rating information
                Padding(
                  padding: EdgeInsets.only(
                    top: 41.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Average Rating+total ratings
                      Column(
                        children: [
                          Text(
                            //average rating of product
                            productPageProvider.averageNumber
                                .toStringAsFixed(1)
                                .toString(),
                            style: headerStyle.copyWith(
                                fontSize: 44, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            //Total ratings
                            "${product.reviews.length} Ratings",
                            style: headerStyle.copyWith(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     left: 28.w,
                          //     right: 10.w,
                          //   ),
                          //   child: RatingPyramid(),
                          // ),
                          RatingLineProgressIndicator(
                              star1review:
                                  productPageProvider.stars5Number.toDouble(),
                              star2review:
                                  productPageProvider.stars4Number.toDouble(),
                              star3review:
                                  productPageProvider.stars3Number.toDouble(),
                              star4review:
                                  productPageProvider.stars2Number.toDouble(),
                              star5review:
                                  productPageProvider.stars1Number.toDouble())
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Number of reviews avalible
                      Text(
                        '8 reviews',
                        style: headerStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              productPageProvider.showPhotos();
                              //When pressed only those reviews would be shown that are with photos
                            },
                            icon: const Icon(
                                Icons.check_box_outline_blank_rounded),
                            selectedIcon: Icon(
                              Icons.check_box_rounded,
                              color: primaryRed,
                            ),
                            isSelected: productPageProvider.photosOrNot,
                          ),
                          Text(
                            'With photo',
                            style: headerStyle.copyWith(),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
