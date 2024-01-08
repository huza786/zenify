import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconButtonLogSign extends StatelessWidget {
  final Widget iconSymbol;
  final VoidCallback impementFunction;
  const IconButtonLogSign(
      {super.key, required this.iconSymbol, required this.impementFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        impementFunction;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            height: 92.h,
            width: 122.h,
            child: Center(child: iconSymbol),
          ),
        ),
      ),
    );
  }
}
