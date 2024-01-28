import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/expandable_model_and_provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    //Main provider of product page
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    //Provider providing product card values
    final productCardProvider = Provider.of<ProductCardState>(context);
    final expandedProvider = Provider.of<ExpandedCardProvider>(context);

    //Method of passing an arguments to page in namedpush is just that you have
    //to provide arguments as below in page and then pass them in widgets with arguments property
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //Adding share button
          Icon(Icons.share)
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          product.title.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
            child: Column(
              children: [
                //Images row
                SizedBox(
                  height: 413.h,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: SizedBox(
                          height: 413.h,
                          width: 275.w,
                          child: Image.asset(
                            product.productImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //sizes select
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            width: 1.0,
                            color:
                                primaryRed, // Customize border color as needed
                          ),
                        ),
                        height: 40.h,
                        width: 138.w,
                        child: Center(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText:
                                  '', // Set empty hintText to hide default text in dropdown
                              border: InputBorder.none, // Remove default border
                              contentPadding:
                                  EdgeInsets.zero, // Adjust content padding
                              isDense:
                                  true, // Reduce the height of the input field
                              alignLabelWithHint:
                                  true, // Align the label with the hint text
                            ),
                            value: productPageProvider.selectedSize,
                            items: productPageProvider.sizesList
                                .map(
                                  (size) => DropdownMenuItem<String>(
                                    value: size,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 4),
                                      child: Text(
                                        size,
                                        style:
                                            headerStyle.copyWith(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (size) {
                              productPageProvider.selectItem(size.toString());
                            },
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            width: 1.0,
                            color:
                                primaryRed, // Customize border color as needed
                          ),
                        ),
                        height: 40.h,
                        width: 138.w,
                        child: Center(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              hintText:
                                  '', // Set empty hintText to hide default text in dropdown
                              border: InputBorder.none, // Remove default border
                              contentPadding:
                                  EdgeInsets.zero, // Adjust content padding
                              isDense:
                                  true, // Reduce the height of the input field
                              alignLabelWithHint:
                                  true, // Align the label with the hint text
                            ),
                            value: productPageProvider.selectedColour,
                            items: productPageProvider.colorsList
                                .map(
                                  (size) => DropdownMenuItem<String>(
                                    value: size,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 4),
                                      child: Text(
                                        size,
                                        style:
                                            headerStyle.copyWith(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (colour) {
                              productPageProvider
                                  .selectColour(colour.toString());
                            },
                          ),
                        ),
                      ),
                      //Favorite Button
                      IconButton(
                        style: ButtonStyle(
                            iconSize: MaterialStateProperty.all(20),
                            iconColor: MaterialStateProperty.all(Colors.grey),
                            shadowColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            elevation: MaterialStateProperty.all<double>(2),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white)),
                        onPressed: () {
                          productCardProvider.favoriteFunction();
                        },
                        isSelected: productCardProvider.favoriteOrNot,
                        selectedIcon: Icon(
                          Icons.favorite,
                          color: primaryRed,
                        ),
                        icon: const Icon(Icons.favorite_outline),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Company name and subtitle and rating
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.companyName,
                            style: headerStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(product.subTitle,
                              style: headerStyle.copyWith(fontSize: 11)),
                          SizedBox(
                            width: 125.w,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoutes.ratingPage,
                                        arguments: product);
                                  },
                                  child: RatingBarIndicator(
                                    unratedColor: Colors.grey,
                                    itemSize: 16,
                                    rating: productCardProvider.rating,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    direction: Axis.horizontal,
                                  ),
                                ), //rating in numbers next to rating
                                Text(
                                  '(${product.initRating})',
                                  style: headerStyle.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        //Sale Price

                        product.salePrice != 0
                            ? Text(
                                '\$${product.salePrice}',
                                style: headerStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              )
                            : const SizedBox.shrink(),
                        //Orignal Price
                        Text(
                          '\$${product.originalPrice}',
                          style: headerStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: product.salePrice != 0
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ],
                    ), // Sale price and org name
                  ],
                ), //title rowmain row
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.'),
                ),
                Column(
                  children: expandedProvider.expandList
                      .map(
                        (ExpandItem item) => ExpansionTile(
                          title: Text(
                            item.expandedText.toString(),
                            style: headerStyle,
                          ),
                          childrenPadding: const EdgeInsets.only(left: 30),
                          children: [
                            Text(
                              item.headerText,
                              style: headerStyle,
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can also like this',
                    style: headerStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 300.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView.builder(
                              //New Products
                              scrollDirection: Axis.horizontal,
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                // Access each product map in the list
                                Product currentProduct = productList[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: ProductCard(
                                    product: currentProduct,
                                  ),
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Material(
        elevation: 1,
        shadowColor: Colors.grey,
        child: Container(
            height: 104.h,
            width: 375.w,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //discard button

                //apply button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    //make a method to filter items
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 343.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: primaryRed),
                      child: Center(
                        child: Text(
                          'ADD TO CART',
                          style: headerStyle.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

/**ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  expandedProvider.expandCard(panelIndex, isExpanded);
                },
                children: expandedProvider.expandList
                    .map(
                      (ExpandItem item) => ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerText),
                            );
                          },
                          body: Container(
                            height: 105,
                            width: 343,
                            child: Center(
                              child: Text(item.expandedText),
                            ),
                          ),
                          isExpanded: item.isExpanded),
                    )
                    .toList(),
              ) */
