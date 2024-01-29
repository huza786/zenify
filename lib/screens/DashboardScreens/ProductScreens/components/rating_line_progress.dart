import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/1star.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/2stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/3stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';
import 'package:zenify/utils/globalvariable.dart';

class RatingLineProgressIndicator extends StatelessWidget {
  final int star1review;
  final int star2review;
  final int star3review;
  final int star4review;
  final int star5review;

  RatingLineProgressIndicator(
      {super.key,
      required this.star1review,
      required this.star2review,
      required this.star3review,
      required this.star4review,
      required this.star5review});

  @override
  Widget build(BuildContext context) {
    final int total_reviews =
        star1review + star2review + star3review + star4review + star5review;
    final double progress5 =
        total_reviews != 0 ? star5review / total_reviews + 0.01 : 0;
    final double progress4 =
        total_reviews != 0 ? star4review / total_reviews + 0.01 : 0;
    final double progress3 =
        total_reviews != 0 ? star3review / total_reviews + 0.01 : 0;
    final double progress2 =
        total_reviews != 0 ? star2review / total_reviews + 0.01 : 0;
    final double progress1 =
        total_reviews != 0 ? star1review / total_reviews + 0.01 : 0;
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //5 stars line
          Row(
            children: [
              const StarRow5(),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 10.w),
                child: SizedBox(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: progress5,
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
              const StarRow4(),
              Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 6.h, left: 10.w),
                child: SizedBox(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: progress4,
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
              const StarRow3(),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 10.w),
                child: SizedBox(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: progress3,
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
              const StarRow2(),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, top: 6.h, left: 10.w),
                child: SizedBox(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: progress2,
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
              const StarRow1(),
              Padding(
                padding: EdgeInsets.only(top: 3.h, left: 10.w),
                child: SizedBox(
                  width: 125.w,
                  child: LinearProgressIndicator(
                    color: primaryRed,
                    value: progress1,
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
