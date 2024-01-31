import 'package:flutter/material.dart';
import 'package:zenify/screens/DashboardScreens/FavoriteScreens/components/favorite_model.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';

class FavoriteListState with ChangeNotifier {
  List<FavoriteModel> favoriteList = [];
  //TODO: add a function to save all favorite items to this list
  void addToFavoriteList(Product product, FavoriteModel favoriteProduct) {
    favoriteProduct.product = product;
    favoriteList.add(favoriteProduct);
    // notifyListeners();
  }
}
