import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/utils/globalvariable.dart';

class ProductCard extends StatefulWidget {
//  final bool favoriteOrNot ;
//  final bool newOrNot ;
//  final String title ;
//  final String subTitle ;
//  final double orignalPrice;
// final  double? salePrice;
//  final String productImage;
//  final double initRating ;
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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
        widget.product.salePrice! / widget.product.originalPrice * 100;

    return Consumer<ProductCardState>(
      builder: (context, productCardState, _) => ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        child: SizedBox(
          // decoration: BoxDecoration(color: Colors.transparent),
          height: 320.h,
          width: 150.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  height: 184.h,
                  width: 148.w,
                  widget.product.productImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 9.w,
                child: widget.product.newOrNot
                    ? Container(
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
                top: 155.h,
                left: 105.w,
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
                top: 191.h,
                child: SizedBox(
                  width: 125.w,
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
                top: 211.h,
                child: Text(
                  widget.product.subTitle,
                  style: headerStyle.copyWith(fontSize: 11, color: greyColor),
                ),
              ),
              //Title
              Positioned(
                top: 227.h,
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
                top: 246.h,
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
                            '${widget..product.originalPrice}\$',
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
