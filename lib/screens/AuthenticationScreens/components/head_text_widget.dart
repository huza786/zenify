import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class HeadText extends StatelessWidget {
  final String headText;
  const HeadText({super.key, required this.headText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 50, 0, 0),
      child: Text(
        headText,
        style: headerStyle.copyWith(
          fontSize: 34,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
