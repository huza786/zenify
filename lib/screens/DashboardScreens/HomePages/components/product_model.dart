import 'package:zenify/screens/DashboardScreens/HomePages/components/review_model.dart';

enum ProductState { newProduct, saleProduct, nullProduct, outOfStock }

class Product {
  String productImage;
  String title;
  String subTitle;
  double originalPrice;
  double salePrice;
  bool favoriteOrNot;
  ProductState productStatus; // Change type to ProductState
  double initRating;
  String companyName;
  String description;
  List<Review> reviews;

  Product({
    required this.productImage,
    required this.title,
    required this.subTitle,
    required this.originalPrice,
    required this.salePrice,
    required this.favoriteOrNot,
    required this.productStatus,
    required this.initRating,
    required this.companyName,
    required this.description,
    required this.reviews,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productImage: map['productImage'],
      title: map['title'],
      subTitle: map['subTitle'],
      originalPrice: map['originalPrice'],
      salePrice: map['salePrice'],
      favoriteOrNot: map['favoriteOrNot'],
      productStatus: _parseProductState(map['newOrNot']),
      initRating: map['initRating'],
      companyName: map['companyName'],
      description: map['description'],
      reviews: (map['reviews'] as List<dynamic>)
          .map((reviewMap) => Review.fromMap(reviewMap))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'title': title,
      'subTitle': subTitle,
      'originalPrice': originalPrice,
      'salePrice': salePrice,
      'favoriteOrNot': favoriteOrNot,
      'newOrNot': _serializeProductState(productStatus),
      'initRating': initRating,
      'companyName': companyName,
      'description': description,
      'reviews': reviews.map((review) => review.toMap()).toList(),
    };
  }

  // Helper method to convert ProductState to a string
  static String _serializeProductState(ProductState state) {
    return state.toString().split('.').last;
  }

  // Helper method to parse a string into ProductState
  static ProductState _parseProductState(String? stateString) {
    if (stateString == 'newProduct') {
      return ProductState.newProduct;
    } else if (stateString == 'saleProduct') {
      return ProductState.saleProduct;
    } else if (stateString == 'outOfStock') {
      return ProductState.outOfStock;
    } else {
      return ProductState.nullProduct;
    }
  }
}
