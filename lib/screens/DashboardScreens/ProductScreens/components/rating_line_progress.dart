import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Column(
      children: [
        //5 stars line
        Padding(
          padding: EdgeInsets.only(top: 3.h),
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
        //4 stars line
        Padding(
          padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
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
        //3 stars line
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
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
        //2 stars line
        Padding(
          padding: EdgeInsets.only(bottom: 2.h, top: 6.h),
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
        //1 stars line
        Padding(
          padding: EdgeInsets.only(top: 3.h),
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
      ],
    );
  }
}
