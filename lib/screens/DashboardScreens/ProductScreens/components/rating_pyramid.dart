import 'package:flutter/material.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/1star.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/2stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/3stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';

class RatingPyramid extends StatelessWidget {
  const RatingPyramid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        //row of 5 stars
        const StarRow5(),
        StarRow4(),
        StarRow3(),
        StarRow2(),
        StarRow1(),
      ]),
    );
  }
}
