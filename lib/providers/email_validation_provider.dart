import 'package:flutter/material.dart';

//TODO: create such email validation that when text field is empty no icons are showed
class EmailState with ChangeNotifier {
  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;
  void emailValidation(String email) {
    // Regular expression for a simple email validation
    // You may want to use a more robust email validation regex
    if (email.isNotEmpty) {
      final RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );
      _isValidEmail = emailRegex.hasMatch(email);
      notifyListeners();
    }
  }
}
