import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_card_providers.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/filter_components_providers.dart';
import 'package:zenify/utils/app_routes.dart';
import 'package:zenify/utils/globalvariable.dart';

class FavoriteCardListView extends StatefulWidget {
//  final bool favoriteOrNot ;
//  final bool newOrNot ;
//  final String title ;
//  final String subTitle ;
//  final double orignalPrice;
// final  double? salePrice;
//  final String productImage;
//  final double initRating ;
  final Product product;
  const FavoriteCardListView({super.key, required this.product});

  @override
  State<FavoriteCardListView> createState() => _FavoriteCardListViewState();
}

class _FavoriteCardListViewState extends State<FavoriteCardListView> {
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
        child: GestureDetector(
          onTap: () {
            //adding full product card info
            Navigator.pushNamed(context, AppRoutes.productPage,
                arguments: widget.product);
          },
          onLongPress: () {
            //On long press bottom widget will appear and you can select size and order
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34)),
                    child: Container(
                      height: 368.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Select Size',
                                style: headerStyle.copyWith(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            //Sizes Selection
                            Wrap(
                              children: Sizes.map(
                                (e) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 11.w, vertical: 8.h),
                                    child: Container(
                                      height: 40.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(e,
                                            style: headerStyle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Colors.black)),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                            const Divider(),
                            //Adding a size info widgit
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Size Info',
                                    style: headerStyle,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      //TODO:add size info
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            GestureDetector(
                              onTap: () {
                                //TODO add ADDTO cart logic
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(36),
                                  shadowColor: Colors.grey,
                                  elevation: 4,
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(36),
                                        color: primaryRed),
                                    child: Center(
                                      child: Text(
                                        'Add To Cart',
                                        style: headerStyle.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          child: SizedBox(
            height: (104 + 12).h,
            child: Stack(
              //Image
              children: [
                Container(
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
                        left: 9.w,
                        child: () {
                          if (widget.product.productStatus ==
                              ProductState.newProduct) {
                            return Container(
                              height: 24.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: Center(
                                child: Text(
                                  'NEW',
                                  style: headerStyle.copyWith(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          } else if (widget.product.productStatus ==
                              ProductState.saleProduct) {
                            return Container(
                              height: 24.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: primaryRed,
                                borderRadius: BorderRadius.circular(29),
                              ),
                              child: Center(
                                child: Text(
                                  "-${salePercentage.roundToDouble().toInt().toString()}%",
                                  style: headerStyle.copyWith(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }(),
                      ),

                      //rating
                      Positioned(
                        top: 76.h,
                        left: 196.w,
                        child: SizedBox(
                          width: 100.w,
                          height: 14.h,
                          child: Row(
                            children: [
                              RatingBarIndicator(
                                itemSize: 14,
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
                        top: 15.h,
                        left: 116.w,
                        child: Text(
                          widget.product.subTitle,
                          style: headerStyle.copyWith(
                              fontSize: 11, color: Colors.grey),
                        ),
                      ),
                      //Title
                      Positioned(
                        top: 29.h,
                        left: 116.w,
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
                        top: 74.h,
                        left: 118.98.w,
                        child: () {
                          if (widget.product.productStatus ==
                              ProductState.saleProduct) {
                            return Row(
                              children: [
                                Text(
                                  '${widget.product.originalPrice.toInt()}\$',
                                  style: headerStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  '\$${widget.product.salePrice.toInt()}',
                                  style: headerStyle.copyWith(
                                      fontSize: 14,
                                      color: primaryRed,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            );
                          } else {
                            return Text(
                              '${widget.product.originalPrice.toInt()}\$',
                              style: headerStyle.copyWith(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            );
                          }
                        }(),
                      ),
                    ], //children
                  ),
                ),
                //Color Selected
                Positioned(
                  top: 51.h,
                  left: 116.w,
                  child: Row(
                    children: [
                      Text(
                        'Color: ',
                        style: headerStyle.copyWith(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Blue',
                        style: headerStyle.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                //Size Selected
                Positioned(
                  top: 51.h,
                  left: 198.w,
                  child: Row(
                    children: [
                      Text(
                        'Size: ',
                        style: headerStyle.copyWith(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                      //TODO: add size property of favorite list
                      Text(
                        'L',
                        style: headerStyle.copyWith(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                ///Shopping Cart Button
                Positioned(
                  top: 70.23.h,
                  left: 290.w,
                  child: IconButton(
                    style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(20),
                        iconColor: MaterialStateProperty.all(Colors.grey),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        elevation: MaterialStateProperty.all<double>(2),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryRed)),
                    onPressed: () {
                      //TODO: add to cart logic
                    },
                    // isSelected: widget.product.favoriteOrNot,
                    selectedIcon: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
