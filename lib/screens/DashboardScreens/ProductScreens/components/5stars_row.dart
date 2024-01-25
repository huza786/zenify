import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow5 extends StatelessWidget {
  const StarRow5({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      // width: 75.w,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
