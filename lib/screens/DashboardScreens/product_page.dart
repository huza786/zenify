import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';
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
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    final productCardProvider = Provider.of<ProductCardState>(context);

    //Method of passing an arguments to page in named push is just that you have
    //to provide arguments as below in page and then pass them in widgets with arguments property
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
        appBar: AppBar(
          actions: [
            //Adding share button
            Icon(Icons.share)
          ],
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            product.title.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //Images row
              Container(
                height: 413.h,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
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
                          color: primaryRed, // Customize border color as needed
                        ),
                      ),
                      height: 40.h,
                      width: 138.w,
                      child: Center(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
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
                                  child: Text(
                                    size,
                                    style: headerStyle.copyWith(fontSize: 14),
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
                          color: primaryRed, // Customize border color as needed
                        ),
                      ),
                      height: 40.h,
                      width: 138.w,
                      child: Center(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
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
                                  child: Text(
                                    size,
                                    style: headerStyle.copyWith(fontSize: 14),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (colour) {
                            productPageProvider.selectColour(colour.toString());
                          },
                        ),
                      ),
                    ),
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
            ],
          ),
        ));
  }
}
