import 'package:flutter/material.dart';
import 'package:zenify/screens/DashboardScreens/HomePages/components/review_model.dart';

class ProductPageProvider with ChangeNotifier {
  List<String> sizesList = [
    'Size',
    'Extra Small',
    'Small',
    'Medium',
    'Large',
    'Extra Large'
  ];
  String selectedSize = 'Size';
  void selectItem(String size) {
    selectedSize = size;
    notifyListeners();
  }

  List<String> colorsList = [
    'Colour',
    'Black',
    'Blue',
    'White',
    'Yellow',
    'Orange',
    'Grey'
  ];
  String selectedColour = 'Colour';
  void selectColour(String Colour) {
    selectedColour = Colour;
    notifyListeners();
  }

  bool _photosOrNot = false;
  bool get photosOrNot => _photosOrNot;
  void showPhotos() {
    _photosOrNot = !_photosOrNot;
    notifyListeners();
  }

  double _averageNumber = 0;
  double sumAvarageSum = 0;
  double get averageNumber => _averageNumber;
  void showAverageNumber(List<Review> reviews) {
    double sumAvarageSum = 0;

    for (int i = 0; i < reviews.length; i++) {
      print(reviews[i].starRating);
      sumAvarageSum = sumAvarageSum + reviews[i].starRating;
      print("sumAvarageSum=$sumAvarageSum");
    }
    print(_averageNumber = sumAvarageSum / reviews.length);
    _averageNumber = sumAvarageSum / reviews.length;
    // notifyListeners();
  }

  int _stars5Number = 0;

  int get stars5Number => _stars5Number;

  // set stars5Number(int value) {
  //   _stars5Number = value;
  // }
  int _stars4Number = 0;

  int get stars4Number => _stars4Number;

  // set stars4Number(int value) {
  //   _stars4Number = value;
  // }
  int _stars3Number = 0;

  int get stars3Number => _stars3Number;

  // set stars3Number(int value) {
  //   _stars3Number = value;
  // }
  int _stars2Number = 0;

  int get stars2Number => _stars2Number;

  // set stars2Number(int value) {
  //   _stars2Number = value;
  // }
  int _stars1Number = 0;

  int get stars1Number => _stars1Number;

  // set stars1Number(int value) {
  //   _stars1Number = value;
  // }
  void showStarsIntValue(List<Review> reviews) {
    int review5Stars = 0;
    int review4Stars = 0;
    int review3Stars = 0;
    int review2Stars = 0;
    int review1Stars = 0;
    //TODO: fixing logic this one doesnot work well

    for (int i = 0; i < reviews.length; i++) {
      if (reviews[i].starRating == 5) {
        review5Stars++;
      } else if (reviews[i].starRating == 4) {
        review4Stars++;
      } else if (reviews[i].starRating == 3) {
        review3Stars++;
      } else if (reviews[i].starRating == 2) {
        review2Stars++;
      } else {
        review1Stars++;
      }
    }

    _stars5Number = review5Stars;
    _stars4Number = review4Stars;
    _stars3Number = review3Stars;
    _stars2Number = review2Stars;
    _stars1Number = review1Stars;
    // notifyListeners();
  }

  List<Review> photoReviews = [];

  void addPhotoReviews(List<Review> reviews) {
    // Filter reviews based on the condition (second review has non-empty photos)
    List<Review> filteredReviews =
        reviews.where((element) => element.photos.isNotEmpty).toList();

    // Add the filtered reviews to the photoReviews list
    photoReviews.addAll(filteredReviews);
    notifyListeners();
  }
}
