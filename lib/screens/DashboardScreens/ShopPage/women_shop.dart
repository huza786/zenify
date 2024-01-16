import 'package:flutter/material.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/category_card.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/sales_card.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class WomenShopPage extends StatelessWidget {
  const WomenShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.womencategory);
            },
            child: const SalesCard()),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
