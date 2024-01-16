import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class CategoryCard extends StatelessWidget {
  String title;
  String image;
  CategoryCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Card(
        color: const Color(0xffFFFFFF),
        elevation: 0,
        child: SizedBox(
          height: 100.h,
          width: 343.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                title,
                style: headerStyle.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: Image.asset(
                image,
                width: 171.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
