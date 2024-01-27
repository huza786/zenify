import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/1star.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/2stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/3stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';
import 'package:zenify/utils/globalvariable.dart';

class RatingLineProgressIndicator extends StatelessWidget {
  final double star1review;
  final double star2review;
  final double star3review;
  final double star4review;
  final double star5review;

  const RatingLineProgressIndicator(
      {super.key,
      required this.star1review,
      required this.star2review,
      required this.star3review,
      required this.star4review,
      required this.star5review});

  @override
  Widget build(BuildContext context) {
    final double total_reviews =
        star1review + star2review + star3review + star4review + star5review;
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //5 stars line
          Row(
            children: [
              StarRow5(),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 10.w),
                child: Container(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: star5review / total_reviews,
                    backgroundColor: backgroundColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  star5review.toInt().toString(),
                  style: headerStyle.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          //4 stars line
          Row(
            children: [
              StarRow4(),
              Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 10.w),
                child: Container(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: star4review / total_reviews,
                    backgroundColor: backgroundColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  star4review.toInt().toString(),
                  style: headerStyle.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          //3 stars line
          Row(
            children: [
              StarRow3(),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 10.w),
                child: Container(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: star3review / total_reviews,
                    backgroundColor: backgroundColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  star3review.toInt().toString(),
                  style: headerStyle.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          //2 stars line
          Row(
            children: [
              StarRow2(),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, top: 6.h, left: 10.w),
                child: Container(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: star2review / total_reviews,
                    backgroundColor: backgroundColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  star2review.toInt().toString(),
                  style: headerStyle.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          //1 stars line
          Row(
            children: [
              StarRow1(),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 10.w),
                child: Container(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: star1review / total_reviews + 0.01,
                    backgroundColor: backgroundColor,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
                child: Text(
                  star1review.toInt().toString(),
                  style: headerStyle.copyWith(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
