import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class SalesCard extends StatelessWidget {
  const SalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Card(
        color: primaryRed,
        elevation: 0,
        child: SizedBox(
          height: 100.h,
          width: 343.w,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('SUMMER SALES',
                    style: headerStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white)),
                Text('Up to 50% off',
                    style: headerStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
