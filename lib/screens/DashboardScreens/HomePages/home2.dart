import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class HomeTwo extends StatefulWidget {
  const HomeTwo({super.key});

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  @override
  Widget build(BuildContext context) {
    return
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   forceMaterialTransparency: true,
        //   leading: IconButton(
        //       onPressed: () => Navigator.pop(context),
        //       icon: const Icon(Icons.arrow_back_ios_new)),
        //   iconTheme: const IconThemeData(color: Colors.black),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        Column(
      children: [
        //main poster=> new collection
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                fit: BoxFit.cover,
                smallBanner,
                height: 390.h,
                width: 375.w,
              ),
              Positioned(
                  height: 34.h,
                  // width: 247.h,
                  top: 305.h,
                  left: 110.h,
                  child: Text(
                    'New Collection',
                    style: headerStyle.copyWith(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //colomn containing summer block and black poster
            Column(
              children: [
                // Summer Sale Block
                SizedBox(
                  height: 186.h,
                  width: 187.w,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 0, 0, 0),
                      child: Text(
                        'Summer sale',
                        style: headerStyle.copyWith(
                            fontSize: 34,
                            color: primaryRed,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                //Black Poster
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/black_shirt.png',
                      height: 187.h,
                      width: 187.w,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 120.h,
                        left: 15.w,
                        child: Text(
                          'Black',
                          style: headerStyle.copyWith(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ))
                  ],
                ),
              ],
            ),
            Image.asset(
              'assets/images/hoddie.png',
              fit: BoxFit.cover,
              height: 374.h,
              width: 188.w,
            )
          ],
        ),
      ],
    );
  }
}
