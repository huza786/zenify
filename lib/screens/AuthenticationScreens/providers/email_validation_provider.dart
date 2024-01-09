import 'package:flutter/material.dart';

enum EmailValidationState { Valid, Invalid, None }

class EmailState with ChangeNotifier {
  EmailValidationState _emailValidationState = EmailValidationState.None;

  EmailValidationState get emailValidationState => _emailValidationState;

  void emailValidation(String email) {
    if (email.isNotEmpty) {
      final RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );
      _emailValidationState = emailRegex.hasMatch(email)
          ? EmailValidationState.Valid
          : EmailValidationState.Invalid;
    } else {
      _emailValidationState = EmailValidationState.None;
    }

    notifyListeners();
  }
}
