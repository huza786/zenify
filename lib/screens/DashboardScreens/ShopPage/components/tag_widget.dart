import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class TagWidget extends StatelessWidget {
  String? tagTitle;
  VoidCallback? tagFunction;

  TagWidget({Key? key, required this.tagTitle, this.tagFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 12.h, bottom: 16.h),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(100.w, 30.h),
          ),
        ),
        onPressed: () {
          tagFunction?.call();
        },
        child: Text(
          tagTitle!,
          style: headerStyle.copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
