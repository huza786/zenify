import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_line_progress.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_pyramid.dart';
import 'package:zenify/utils/globalvariable.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  //TODO: you have to navigation and argiments to show full rating stats fetching from product model
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 14.w,
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
                  left: 15.w,
                ),
                child: Row(
                  children: [
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
                      height: 95.h,
                      width: 236.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 28.w, right: 10.w),
                            child: RatingPyramid(),
                          ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
