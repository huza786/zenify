// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/4stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/5stars_row.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_line_progress.dart';
import 'package:zenify/screens/DashboardScreens/ProductScreens/components/rating_pyramid.dart';
import 'package:zenify/screens/DashboardScreens/provider/product_page_providers.dart';
import 'package:zenify/utils/globalvariable.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  bool photosOrNot = false;
  void didChangeDependencies() {
    super.didChangeDependencies();
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    productPageProvider.showStarsIntValue(product.reviews);
    productPageProvider.showAverageNumber(product.reviews);
  }

  @override
  Widget build(BuildContext context) {
    final productPageProvider = Provider.of<ProductPageProvider>(context);
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    // final Product product =
    //     ModalRoute.of(context)!.settings.arguments as Product;
    // // final averageNumber =
    // //     productPageProvider.showAverageNumber(product.reviews);
    // productPageProvider.showStarsIntValue(product.reviews);
    // productPageProvider.showAverageNumber(product.reviews);

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
          // title: Text(
          //   'Rating',
          //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18.h,
                      ),
                      child: Text(
                        'Rating&Reviews',
                        style: headerStyle.copyWith(
                            fontSize: 34,
                            color: Colors.black,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    //Rating information
                    Padding(
                      padding: EdgeInsets.only(
                        top: 41.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Average Rating+total ratings
                          Column(
                            children: [
                              Text(
                                //average rating of product
                                productPageProvider.averageNumber
                                    .toStringAsFixed(1)
                                    .toString(),
                                style: headerStyle.copyWith(
                                    fontSize: 44, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                //Total ratings
                                "${product.reviews.length} Ratings",
                                style: headerStyle.copyWith(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     left: 28.w,
                              //     right: 10.w,
                              //   ),
                              //   child: RatingPyramid(),
                              // ),
                              RatingLineProgressIndicator(
                                  star1review: productPageProvider.stars5Number,
                                  star2review: productPageProvider.stars4Number,
                                  star3review: productPageProvider.stars3Number,
                                  star4review: productPageProvider.stars2Number,
                                  star5review: productPageProvider.stars1Number)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 33.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Number of reviews avalible
                          Text(
                            '${product.reviews.length} reviews',
                            style: headerStyle.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  productPageProvider.showPhotos();
                                  //When pressed only those reviews would be shown that are with photos
                                },
                                icon: const Icon(
                                    Icons.check_box_outline_blank_rounded),
                                selectedIcon: Icon(
                                  Icons.check_box_rounded,
                                  color: primaryRed,
                                ),
                                isSelected: productPageProvider.photosOrNot,
                              ),
                              Text(
                                'With photo',
                                style: headerStyle.copyWith(),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                //Review Card
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, reviewIndex) => SizedBox(
                      width: 327.w,
                      height: 373.h + 64.h,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 16.h,
                            left: 16.w,
                            child: Container(
                              height: 357.h + 64.h,
                              width: 311.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: 16.h,
                                  top: 24.h,
                                  left: 24.w,
                                  right: 24.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //UserName
                                    Text(
                                      product.reviews[reviewIndex].userName,
                                      style: headerStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 125.w,
                                          child: Row(
                                            children: [
                                              //Reviews particular person
                                              RatingBarIndicator(
                                                itemSize: 16,
                                                rating: product
                                                    .reviews[reviewIndex]
                                                    .starRating
                                                    .toDouble(),
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star_rounded,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                direction: Axis.horizontal,
                                              ), //rating in numbers next to rating
                                              Text(
                                                '(${product.reviews.length})',
                                                style: headerStyle.copyWith(
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //Date of review that was created
                                        Text(
                                          """${product.reviews[reviewIndex].createdAt.month.toString()} ${product.reviews[reviewIndex].createdAt.day.toString()},${product.reviews[reviewIndex].createdAt.year.toString()}""",
                                          style: headerStyle.copyWith(
                                              fontSize: 11, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    //review Text
                                    Text(
                                      product.reviews[reviewIndex].reviewText,
                                      style: headerStyle.copyWith(),
                                    ),
                                    product.reviews[reviewIndex].photos
                                            .isNotEmpty
                                        ? SizedBox(
                                            height: 104.h,
                                            child: ListView.builder(
                                              itemCount: product
                                                  .reviews[reviewIndex]
                                                  .photos
                                                  .length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (
                                                context,
                                                photosIndex,
                                              ) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 2,
                                                  ),
                                                  child: SizedBox(
                                                    height: 104.h,
                                                    width: 104.w,
                                                    child: Image.asset(
                                                      product
                                                          .reviews[reviewIndex]
                                                          .photos[photosIndex],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Helpful',
                                          style: headerStyle.copyWith(
                                              fontSize: 11),
                                        ),
                                        IconButton(
                                          iconSize: 11,
                                          onPressed: () {
                                            //TODO: add functionality to review for saving helpful index
                                          },
                                          icon: Icon(
                                            Icons.thumb_up,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              product.reviews[reviewIndex].userProfilePhoto,
                            ),
                            radius: 16,
                          ),
                        ],
                      ),
                    ),
                    childCount: product.reviews.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
/*SizedBox(
                  width: 327.w,
                  height: 373.h + 64.h,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16.h,
                        left: 16.w,
                        child: Container(
                          height: 357.h + 64.h,
                          width: 311.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: 16.h,
                              top: 24.h,
                              left: 24.w,
                              right: 24.w,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.reviews[0].userName,
                                  style: headerStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 125.w,
                                      child: Row(
                                        children: [
                                          RatingBarIndicator(
                                            itemSize: 16,
                                            rating: productPageProvider
                                                .averageNumber,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            direction: Axis.horizontal,
                                          ), //rating in numbers next to rating
                                          Text(
                                            '(${product.reviews.length})',
                                            style: headerStyle.copyWith(
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      """${product.reviews[0].createdAt.month.toString()} ${product.reviews[0].createdAt.day.toString()},${product.reviews[0].createdAt.year.toString()}""",
                                      style: headerStyle.copyWith(
                                          fontSize: 11, color: Colors.grey),
                                    )
                                  ],
                                ),
                                Text(
                                  product.reviews[0].reviewText,
                                  style: headerStyle.copyWith(),
                                ),
                                product.reviews[0].photos.isNotEmpty
                                    ? SizedBox(
                                        height: 104.h,
                                        child: ListView.builder(
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (
                                            context,
                                            index,
                                          ) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 2,
                                              ),
                                              child: SizedBox(
                                                height: 104.h,
                                                width: 104.w,
                                                child: Image.asset(
                                                  product.reviews[0].photos[0],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Helpful',
                                      style: headerStyle.copyWith(fontSize: 11),
                                    ),
                                    IconButton(
                                      iconSize: 11,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.thumb_up,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          product.reviews[1].userProfilePhoto,
                        ),
                        radius: 16,
                      ),
                    ],
                  ),
                ), */