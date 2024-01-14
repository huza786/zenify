import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';
import 'package:zenify/screens/DashboardScreens/ShopPage/components/category_model.dart';

TextStyle customTextStyle = GoogleFonts.metrophobic();
Color primaryRed = const Color(0xFFDB3022);
Color backgroundColor = const Color(0xFFF9F9F9);

Color greyColor = const Color.fromARGB(255, 5, 5, 5);

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
List<Product> productList = [
  Product(
    productImage: blackProduct,
    title: 'Cool T-Shirt 1',
    subTitle: 'Mango Boy 1',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    newOrNot: false,
    initRating: 4.5,
  ),
  Product(
    productImage: blackProduct,
    title: 'Fancy T-Shirt 2',
    subTitle: 'Mango Boy 2',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    newOrNot: true,
    initRating: 4.2,
  ),
  Product(
    productImage: blackProduct,
    title: 'Stylish T-Shirt 3',
    subTitle: 'Mango Boy 3',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    newOrNot: false,
    initRating: 3.8,
  ),
  Product(
    productImage: blackProduct,
    title: 'Trendy T-Shirt 4',
    subTitle: 'Mango Boy 4',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 4.0,
  ),
  Product(
    productImage: blackProduct,
    title: 'Classic T-Shirt 5',
    subTitle: 'Mango Boy 5',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 3.5,
  ),
  Product(
    productImage: blackProduct,
    title: 'Cool T-Shirt 6',
    subTitle: 'Mango Boy 6',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    newOrNot: false,
    initRating: 4.1,
  ),
  Product(
    productImage: blackProduct,
    title: 'Fancy T-Shirt 7',
    subTitle: 'Mango Boy 7',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    newOrNot: true,
    initRating: 4.8,
  ),
  Product(
    productImage: blackProduct,
    title: 'Stylish T-Shirt 8',
    subTitle: 'Mango Boy 8',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    newOrNot: false,
    initRating: 3.3,
  ),
  Product(
    productImage: blackProduct,
    title: 'Trendy T-Shirt 9',
    subTitle: 'Mango Boy 9',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 4.2,
  ),
  Product(
    productImage: blackProduct,
    title: 'Classic T-Shirt 10',
    subTitle: 'Mango Boy 10',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 3.7,
  ),
  Product(
    productImage: blackProduct,
    title: 'Cool T-Shirt 11',
    subTitle: 'Mango Boy 11',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    newOrNot: false,
    initRating: 4.0,
  ),
  Product(
    productImage: blackProduct,
    title: 'Fancy T-Shirt 12',
    subTitle: 'Mango Boy 12',
    originalPrice: 49.99,
    salePrice: 29.99,
    favoriteOrNot: true,
    newOrNot: true,
    initRating: 3.9,
  ),
  Product(
    productImage: blackProduct,
    title: 'Stylish T-Shirt 13',
    subTitle: 'Mango Boy 13',
    originalPrice: 29.99,
    salePrice: 14.99,
    favoriteOrNot: true,
    newOrNot: false,
    initRating: 4.6,
  ),
  Product(
    productImage: blackProduct,
    title: 'Trendy T-Shirt 14',
    subTitle: 'Mango Boy 14',
    originalPrice: 59.99,
    salePrice: 39.99,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 4.7,
  ),
  Product(
    productImage: blackProduct,
    title: 'Classic T-Shirt 15',
    subTitle: 'Mango Boy 15',
    originalPrice: 34.99,
    salePrice: 0.0,
    favoriteOrNot: false,
    newOrNot: true,
    initRating: 3.2,
  ),
  Product(
    productImage: blackProduct,
    title: 'Cool T-Shirt 16',
    subTitle: 'Mango Boy 16',
    originalPrice: 39.99,
    salePrice: 19.99,
    favoriteOrNot: false,
    newOrNot: false,
    initRating: 4.4,
  ),
];
