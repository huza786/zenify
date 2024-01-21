import 'package:flutter/material.dart';

class ProductPageProvider with ChangeNotifier {
  List<String> sizesList = [
    'Size',
    'Extra Small',
    'Small',
    'Medium',
    'Large',
    'Extra Large'
  ];
  String selectedSize = 'Size';
  void selectItem(String size) {
    selectedSize = size;
    notifyListeners();
  }

  List<String> colorsList = [
    'Colour',
    'Black',
    'Blue',
    'White',
    'Yellow',
    'Orange',
    'Grey'
  ];
  String selectedColour = 'Colour';
  void selectColour(String Colour) {
    selectedColour = Colour;
    notifyListeners();
  }
}
