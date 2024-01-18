import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/utils/globalvariable.dart';

class ProductCardListView extends StatefulWidget {
//  final bool favoriteOrNot ;
//  final bool newOrNot ;
//  final String title ;
//  final String subTitle ;
//  final double orignalPrice;
// final  double? salePrice;
//  final String productImage;
//  final double initRating ;
  final Product product;
  const ProductCardListView({super.key, required this.product});

  @override
  State<ProductCardListView> createState() => _ProductCardListViewState();
}

class _ProductCardListViewState extends State<ProductCardListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   ProductCardState productCardState =
    //       Provider.of<ProductCardState>(context);
    //   productCardState.favoriteOrNot = widget.favoriteOrNot;
    //   productCardState.rating = widget.initRating;
    // });
  }

  @override
  Widget build(BuildContext context) {
    double? salePercentage =
        widget.product.salePrice / widget.product.originalPrice * 100;

    return Consumer<ProductCardState>(
      builder: (context, productCardState, _) => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14)),

        //productcard height and width
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          // decoration: BoxDecoration(color: Colors.transparent),
          height: 104.h,
          width: 343.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  height: 104.h,
                  width: 104.w,
                  widget.product.productImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 300.w,
                child: widget.product.newOrNot
                    ?
                    //Sale or New Product Indicator
                    Container(
                        height: 24.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(29)),
                        child: Center(
                          child: Text(
                            'NEW',
                            style: headerStyle.copyWith(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    : Container(
                        height: 24.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: primaryRed,
                            borderRadius: BorderRadius.circular(29)),
                        child: Center(
                          child: Text(
                            "-${salePercentage.roundToDouble().toInt().toString()}%",
                            style: headerStyle.copyWith(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
              ),

              ///Favorite Button
              Positioned(
                top: 69.23.h,
                left: 290.w,
                child: IconButton(
                  style: ButtonStyle(
                      iconSize: MaterialStateProperty.all(20),
                      iconColor: MaterialStateProperty.all(Colors.grey),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      elevation: MaterialStateProperty.all<double>(2),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    productCardState.favoriteFunction();
                  },
                  isSelected: widget.product.favoriteOrNot,
                  selectedIcon: Icon(
                    Icons.favorite,
                    color: primaryRed,
                  ),
                  icon: const Icon(Icons.favorite_outline),
                ),
              ),
              //rating
              Positioned(
                top: 50.h,
                left: 116.w,
                child: SizedBox(
                  width: 110.w,
                  height: 14.h,
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        itemSize: 16,
                        rating: productCardState.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        direction: Axis.horizontal,
                      ), //rating in numbers next to rating
                      Text(
                        '(${widget.product.initRating})',
                        style: headerStyle.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              //subtitle
              Positioned(
                top: 29.81.h,
                left: 118.89.w,
                child: Text(
                  widget.product.subTitle,
                  style: headerStyle.copyWith(fontSize: 11, color: greyColor),
                ),
              ),
              //Title
              Positioned(
                top: 10.58.h,
                left: 118.98.w,
                child: Text(
                  widget.product.title,
                  style: headerStyle.copyWith(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              //Price
              Positioned(
                top: 69.23.h,
                left: 118.98.w,
                child: widget.product.newOrNot
                    ? Text(
                        '${widget.product.originalPrice}\$',
                        style: headerStyle.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    : Row(
                        children: [
                          Text(
                            '${widget.product.originalPrice}\$',
                            style: headerStyle.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            '\$${widget.product.salePrice}',
                            style: headerStyle.copyWith(
                                fontSize: 16,
                                color: primaryRed,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
              ),
            ], //children
          ),
        ),
      ),
    );
  }
}
