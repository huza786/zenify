import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/utils/globalvariable.dart';

class ProductCard extends StatefulWidget {
  bool favoriteOrNot = false;
  bool newOrNot = true;
  String title = '';
  String subTitle = '';
  double orignalPrice;
  double? salePrice;

  ProductCard({
    super.key,
    required this.newOrNot,
    required this.favoriteOrNot,
    required this.orignalPrice,
    required this.title,
    required this.subTitle,
    this.salePrice,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double? salePercentage = widget.salePrice! / widget.orignalPrice * 100;

    return Consumer<ProductCardState>(
      builder: (context, productCardState, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14), topRight: Radius.circular(14)),
          child: Container(
            // decoration: BoxDecoration(color: Colors.transparent),
            height: 260.h,
            width: 150.w,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    height: 184.h,
                    width: 148.w,
                    blackProduct,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 9.w,
                  child: widget.newOrNot
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
                              "-${salePercentage.roundToDouble().toString()}%",
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
                    isSelected: productCardState.favoriteOrNot,
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
                        RatingBar(
                          itemSize: 20,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 4,
                            ),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 4,
                            ),
                            empty: const Icon(
                              Icons.star_border_rounded,
                              color: Colors.grey,
                              size: 4,
                            ),
                          ),
                          onRatingUpdate: (rating) {
                            productCardState.updateRating(rating);
                          },
                        ),
                        //rating in numbers next to rating
                        Text(
                          '(${context.read<ProductCardState>().rating.toString()})',
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
                    widget.subTitle,
                    style: headerStyle.copyWith(fontSize: 11, color: greyColor),
                  ),
                ),
                //Title
                Positioned(
                  top: 227.h,
                  child: Text(
                    widget.title,
                    style: headerStyle.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                //Price
                Positioned(
                  top: 246.h,
                  child: widget.newOrNot
                      ? Text(
                          '${widget.orignalPrice}\$',
                          style: headerStyle.copyWith(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        )
                      : Row(
                          children: [
                            Text(
                              '${widget.orignalPrice}\$',
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
                              '${widget.salePrice}\$',
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
      ),
    );
  }
}
