import 'package:flutter/material.dart';

class ProductCardState with ChangeNotifier {
  bool _favoriteOrNot = false;
  double _rating = 0;

  double get rating => _rating;
  bool get favoriteOrNot => _favoriteOrNot;

  set favoriteOrNot(bool value) {
    _favoriteOrNot = value;

    notifyListeners();
  }

  set rating(double value) {
    _rating = value;
    notifyListeners();
  }

  void favoriteFunction() {
    _favoriteOrNot = !favoriteOrNot;
    notifyListeners();
  }

  void updateRating(double newRating) {
    _rating = newRating;
    notifyListeners();
  }

  int _toggleSizeSelected = -1;
  get toggleSizeSelected => _toggleSizeSelected;
  void selectSizeToggleItem(int value) {
    _toggleSizeSelected = value;
    notifyListeners();
  }

  int _toggleColorSelected = -1;
  get toggleColorSelected => _toggleColorSelected;
  void selectColorToggleItem(int value) {
    _toggleColorSelected = value;
    notifyListeners();
  }
}
