import 'package:zenify/screens/DashboardScreens/HomePages/components/product_model.dart';

class FavoriteModel {
  Product product;
  String color = '';
  String size = '';

  FavoriteModel({
    required this.product,
    required this.color,
    required this.size,
  });

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      product: Product.fromMap(map['product']),
      color: map['color'],
      size: map['size'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'color': color,
      'size': size,
    };
  }
}
