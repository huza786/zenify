import 'package:flutter/material.dart';
import 'package:zenify/utils/globalvariable.dart';

class LoginSignUpButton extends StatelessWidget {
  final String title;
  const LoginSignUpButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36), color: primaryRed),
        child: Center(
          child: Text(
            title,
            style: headerStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
