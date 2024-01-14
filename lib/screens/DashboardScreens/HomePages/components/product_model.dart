class Product {
  String productImage;
  String title;
  String subTitle;
  double originalPrice;
  double salePrice;
  bool favoriteOrNot;
  bool newOrNot;
  double initRating; // New initRating parameter

  // Constructor
  Product({
    required this.productImage,
    required this.title,
    required this.subTitle,
    required this.originalPrice,
    required this.salePrice,
    required this.favoriteOrNot,
    required this.newOrNot,
    required this.initRating, // Initialize initRating in the constructor
  });

  // Factory method to create a Product instance from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productImage: map['productImage'],
      title: map['title'],
      subTitle: map['subTitle'],
      originalPrice: map['originalPrice'],
      salePrice: map['salePrice'],
      favoriteOrNot: map['favoriteOrNot'],
      newOrNot: map['newOrNot'],
      initRating: map['initRating'], // Initialize initRating from the map
    );
  }

  // Method to convert a Product instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'productImage': productImage,
      'title': title,
      'subTitle': subTitle,
      'originalPrice': originalPrice,
      'salePrice': salePrice,
      'favoriteOrNot': favoriteOrNot,
      'newOrNot': newOrNot,
      'initRating': initRating, // Include initRating in the map
    };
  }
}
