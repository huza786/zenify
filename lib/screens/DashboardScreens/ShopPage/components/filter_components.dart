import 'package:flutter/material.dart';

List categoryList2 = ['All', 'Women', 'Men', 'Boys', 'Girls'];

class FilterProvider with ChangeNotifier {
  List selectedCategory = [];

  addCategory(value) {
    selectedCategory.add(value);
    notifyListeners();
  }

  removeCategory(value) {
    selectedCategory.remove(value);
    notifyListeners();
  }
}
