import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow3 extends StatelessWidget {
  const StarRow3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      // width: 45.w,
      child: const Row(
        children: [
          Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 14,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 14,
          ),
          Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 14,
          ),
        ],
      ),
    );
  }
}
