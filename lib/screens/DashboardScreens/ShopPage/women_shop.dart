import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/category_card.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/sales_card.dart';
import 'package:zenify/utils/globalvariable.dart';

class WomenShopPage extends StatefulWidget {
  const WomenShopPage({super.key});

  @override
  State<WomenShopPage> createState() => _WomenShopPageState();
}

class _WomenShopPageState extends State<WomenShopPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SalesCard(),
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                title: categoriesList[index].title,
                image: categoriesList[index].imageAsset,
              );
            },
          ),
        ),
      ],
    );
  }
}
