import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow1 extends StatelessWidget {
  const StarRow1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star_rounded,
      color: Colors.amber,
      size: 14,
    );
  }
}
