import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle = GoogleFonts.metrophobic();
Color primaryRed = const Color(0xFFDB3022);
Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

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
