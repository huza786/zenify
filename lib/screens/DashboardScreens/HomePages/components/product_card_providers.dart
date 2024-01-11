import 'package:flutter/material.dart';

class ProductCardState with ChangeNotifier {
  bool _favoriteOrNot = false;
  double _rating = 0;
  double get rating => _rating;
  get favoriteOrNot => _favoriteOrNot;
  void favoriteFunction() {
    _favoriteOrNot = !_favoriteOrNot;
    notifyListeners();
  }

  void updateRating(double newRating) {
    _rating = newRating;
    notifyListeners();
  }
}
