import 'package:flutter/material.dart';

List categoryList2 = ['All', 'Women', 'Men', 'Boys', 'Girls'];
List<String> clothingBrands = [
  'Nike',
  'Adidas',
  'Zara',
  'H&M',
  'Levi\'s',
  'Gucci',
  'Calvin Klein',
  'Ralph Lauren',
  'Under Armour',
  'Puma',
  'Tommy Hilfiger',
  'ASOS',
  'Forever 21',
  'Gap',
  'Vans',
  'Converse',
  'Balenciaga',
  'Reebok',
  'Fila',
  'The North Face'
];
List Sizes = ['XS', 'S', 'M', 'L', 'XL'];

class FilterProvider with ChangeNotifier {
  List selectedCategory = [];
  List searchList = clothingBrands;

  addCategory(value) {
    selectedCategory.add(value);
    notifyListeners();
  }

  removeCategory(value) {
    selectedCategory.remove(value);
    notifyListeners();
  }

  List selectedBrands = [];
  addBrand(value) {
    selectedBrands.add(value);
    notifyListeners();
  }

  removeBrand(value) {
    selectedBrands.remove(value);
    notifyListeners();
  }
//   void filterSearchResults(String query) {
//     final suggestion= clothingBrands.where((brand) => false)
}
