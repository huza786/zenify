import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  //TODO: you have to navigation and argiments to show full rating stats fetching from product model
  @override
  Widget build(BuildContext context) {
    final productPageProvider = Provider.of<ProductPageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          //Adding share button
          const Icon(Icons.share)
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
                            '4.3',
                            style: headerStyle.copyWith(
                                fontSize: 44, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            //Total ratings
                            '23 ratings',
                            style: headerStyle.copyWith(),
                          ),
                        ],
                      ),
                      Container(
                        // height: 95.h,
                        // width: 236.w,
                        child: Row(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //     left: 28.w,
                            //     right: 10.w,
                            //   ),
                            //   child: RatingPyramid(),
                            // ),
                            RatingLineProgressIndicator(
                                star1review: 50,
                                star2review: 2,
                                star3review: 4,
                                star4review: 5,
                                star5review: 12)
                          ],
                        ),
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
                              print(productPageProvider.photosOrNot);
                              //When pressed only those reviews would be shown that are with photos
                            },
                            icon: Icon(Icons.check_box_outline_blank_rounded),
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
