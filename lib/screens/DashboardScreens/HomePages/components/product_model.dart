import 'package:zenify/screens/DashboardScreens/HomePages/components/review_model.dart';

class Product {
  String productImage;
  String title;
  String subTitle;
  double originalPrice;
  double salePrice;
  bool favoriteOrNot;
  bool newOrNot;
  double initRating;
  String companyName;
  String description;
  List<Review> reviews; // New property to hold the list of reviews

  Product({
    required this.productImage,
    required this.title,
    required this.subTitle,
    required this.originalPrice,
    required this.salePrice,
    required this.favoriteOrNot,
    required this.newOrNot,
    required this.initRating,
    required this.companyName,
    required this.description,
    required this.reviews, // Initialize the list of reviews in the constructor
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productImage: map['productImage'],
      title: map['title'],
      subTitle: map['subTitle'],
      originalPrice: map['originalPrice'],
      salePrice: map['salePrice'],
      favoriteOrNot: map['favoriteOrNot'],
      newOrNot: map['newOrNot'],
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
      'newOrNot': newOrNot,
      'initRating': initRating,
      'companyName': companyName,
      'description': description,
      'reviews': reviews.map((review) => review.toMap()).toList(),
    };
  }
}
