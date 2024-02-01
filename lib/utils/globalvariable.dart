import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/review_model.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/category_model.dart';

TextStyle customTextStyle = GoogleFonts.metrophobic();
Color primaryRed = const Color(0xFFDB3022);
Color backgroundColor = const Color(0xFFF9F9F9);

const TextStyle headerStyle = TextStyle(fontFamily: 'Metropolis');
const String arrow = 'assets/icons/arrow.svg';
Widget arrowIcon = SvgPicture.asset(
  arrow,
  semanticsLabel: 'arrow',
);
const String google = 'assets/icons/google.svg';
Widget googleIcon = SvgPicture.asset(
  google,
  semanticsLabel: 'arrow',
);
const String phone = 'assets/icons/phone.svg';
Widget phoneIcon = SvgPicture.asset(
  phone,
  semanticsLabel: 'arrow',
);
const String assetImagesDirectry = 'assets/images/';
const String blackProduct = '${assetImagesDirectry}black_product.png';
const String smallBanner = '${assetImagesDirectry}small_banner.png';
const String banner = '${assetImagesDirectry}banner.png';
const String lnd1 = 'assets/images/lnd1.jpg';

const String lnd2 = 'assets/images/lnd2.jpg';

const String lnd3 = 'assets/images/lnd3.jpg';

const String lnd4 = 'assets/images/lnd4.jpg';

const String lnd5 = 'assets/images/lnd5.jpg';

const String lnd6 = 'assets/images/lnd6.jpg';

const String lnd7 = 'assets/images/lnd7.jpg';

const String lnd8 = 'assets/images/lnd8.jpg';
const String ptr1 = 'assets/images/ptr1.jpg';

const String ptr2 = 'assets/images/ptr2.jpg';

const String ptr3 = 'assets/images/ptr3.jpg';

const String ptr4 = 'assets/images/ptr4.jpg';

const String ptr5 = 'assets/images/ptr5.jpg';
const String profilePhoto = 'assets/images/profile.jpg';
List<String> reviewPhotos = [
  ptr1,
  ptr2,
  ptr3,
  ptr4,
  ptr5,
];

List<CategoryModel> categoriesList = [
  CategoryModel(title: "New", imageAsset: lnd1),
  CategoryModel(title: "Clothes", imageAsset: lnd2),
  CategoryModel(title: "Shoes", imageAsset: lnd3),
  CategoryModel(title: "Accessories", imageAsset: lnd4),
];
/* ProductCard(
  title: 'T-Shirt Sailing',
  subTitle: 'Mango Boy',
  orignalPrice: 39.99,
  salePrice: 19.99,
  favoriteOrNot: false,
  newOrNot: false,
) */
List colorsList = ['White', 'Brown', 'Green', 'Black', 'Red'];

List<Review> ReviewList = List.generate(
  8,
  (index) => Review(
    userName: 'Micheal Howard',
    userProfilePhoto: profilePhoto,
    reviewText:
        """The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well. $index""",
    starRating: Random().nextInt(
          5,
        ) +
        1,
    photos: reviewPhotos,
    createdAt: DateTime.now().subtract(
      Duration(
        days: index,
      ),
    ),
  ),
);
List<Product> productList = [
  Product(
    productImage: ptr1,
    title: 'Cool T-Shirt 1',
    subTitle: 'Mango Boy 1',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: true,
    productStatus: ProductState.newProduct,
    initRating: 4.5,
    companyName: 'H&M',
    description: 'A stylish and comfortable t-shirt with a unique design.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr2,
    title: 'Fancy T-Shirt 2',
    subTitle: 'Mango Boy 2',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    productStatus: ProductState.saleProduct,
    initRating: 4.2,
    companyName: 'H&M',
    description: 'An elegant and eye-catching t-shirt for a trendy look.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr2,
    title: 'Stylish T-Shirt 3',
    subTitle: 'Mango Boy 3',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    productStatus: ProductState.newProduct,
    initRating: 3.8,
    companyName: 'H&M',
    description: 'A comfortable and stylish t-shirt with a modern touch.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr3,
    title: 'Trendy T-Shirt 4',
    subTitle: 'Mango Boy 4',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    productStatus: ProductState.saleProduct,
    initRating: 4.0,
    companyName: 'H&M',
    description: 'A trendy t-shirt with a perfect blend of style and comfort.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr3,
    title: 'Classic T-Shirt 5',
    subTitle: 'Mango Boy 5',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    productStatus: ProductState.newProduct,
    initRating: 3.5,
    companyName: 'H&M',
    description: 'A classic t-shirt that never goes out of style.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr3,
    title: 'Cool T-Shirt 6',
    subTitle: 'Mango Boy 6',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    productStatus: ProductState.newProduct,
    initRating: 4.1,
    companyName: 'H&M',
    description: 'Stay cool and comfortable with this stylish t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Fancy T-Shirt 7',
    subTitle: 'Mango Boy 7',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    productStatus: ProductState.newProduct,
    initRating: 4.8,
    companyName: 'H&M',
    description: 'A fancy t-shirt that makes a bold fashion statement.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Stylish T-Shirt 8',
    subTitle: 'Mango Boy 8',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    productStatus: ProductState.saleProduct,
    initRating: 3.3,
    companyName: 'H&M',
    description: 'Achieve a stylish look with this comfortable t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Trendy T-Shirt 9',
    subTitle: 'Mango Boy 9',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    productStatus: ProductState.saleProduct,
    initRating: 4.2,
    companyName: 'H&M',
    description: 'Stay on-trend with this chic and comfortable t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Classic T-Shirt 10',
    subTitle: 'Mango Boy 10',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    productStatus: ProductState.saleProduct,
    initRating: 3.7,
    companyName: 'H&M',
    description: 'A timeless classic for a casual and relaxed look.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Cool T-Shirt 11',
    subTitle: 'Mango Boy 11',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    productStatus: ProductState.saleProduct,
    initRating: 4.0,
    companyName: 'H&M',
    description: 'Stay cool and stylish with this trendy t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Fancy T-Shirt 12',
    subTitle: 'Mango Boy 12',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    productStatus: ProductState.saleProduct,
    initRating: 3.9,
    companyName: 'H&M',
    description: 'Make a statement with this fancy and fashionable t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Stylish T-Shirt 13',
    subTitle: 'Mango Boy 13',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    productStatus: ProductState.saleProduct,
    initRating: 4.6,
    companyName: 'H&M',
    description: 'Step out in style with this comfortable and chic t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr4,
    title: 'Trendy T-Shirt 14',
    subTitle: 'Mango Boy 14',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    productStatus: ProductState.saleProduct,
    initRating: 4.7,
    companyName: 'H&M',
    description: 'Stay trendy and comfortable with this modern t-shirt.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr5,
    title: 'Classic T-Shirt 15',
    subTitle: 'Mango Boy 15',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    productStatus: ProductState.outOfStock,
    initRating: 3.2,
    companyName: 'H&M',
    description: 'A classic choice for a laid-back and casual style.',
    reviews: ReviewList,
  ),
  Product(
    productImage: ptr5,
    title: 'Cool T-Shirt 16',
    subTitle: 'Mango Boy 16',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    productStatus: ProductState.outOfStock,
    initRating: 4.4,
    companyName: 'H&M',
    description: 'Stay cool and fashionable with this trendy t-shirt.',
    reviews: ReviewList,
  ),
  // ... (add more products with unique descriptions)
];
