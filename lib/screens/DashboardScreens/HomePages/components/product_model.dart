/// A class representing a product with essential details.
class Product {
  /// The image URL of the product.
  String productImage;

  /// The title of the product.
  String title;

  /// The subtitle or additional information about the product.
  String subTitle;

  /// The original price of the product.
  double originalPrice;

  /// The discounted sale price of the product.
  double salePrice;

  /// Indicates whether the product is marked as a favorite or not.
  bool favoriteOrNot;

  /// Indicates whether the product is marked as new or not.
  bool newOrNot;

  /// The initial rating of the product.
  double initRating;

  /// The name of the company associated with the product.
  String companyName;

  /// A brief description of the product.
  String description;

  /// Constructor for creating a Product instance.
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
  });

  /// Factory method to create a Product instance from a Map.
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
    );
  }

  /// Method to convert a Product instance to a Map.
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
    };
  }
}
