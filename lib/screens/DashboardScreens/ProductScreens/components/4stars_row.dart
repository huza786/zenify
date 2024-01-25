import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow4 extends StatelessWidget {
  const StarRow4({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      // width: 60.w,
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
