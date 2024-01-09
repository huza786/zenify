import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zenify/providers/email_validation_provider.dart';
import 'package:zenify/utils/globalvariable.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  const EmailTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    EmailValidationState emailValidationState =
        Provider.of<EmailState>(context).emailValidationState;

    Widget suffixIcon = _getSuffixIcon(emailValidationState);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  blurRadius: 1.2,
                )
              ],
              border: Border.all(
                color: _getBorderColor(emailValidationState),
                width: 2.0,
              ),
            ),
            height: 60.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 0, 0, 0),
              child: TextFormField(
                controller: widget.controller,
                onChanged: (value) {
                  Provider.of<EmailState>(context, listen: false)
                      .emailValidation(value);
                },
                decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  hintText: widget.hintText,
                  hintStyle: headerStyle,
                  labelText: widget.labelText,
                  labelStyle: headerStyle,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (emailValidationState == EmailValidationState.Invalid) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: emailValidationState == EmailValidationState.Invalid,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.h, 0, 0, 10.h),
            child: Text(
              "Not a valid email address. Should be 'your@email.com'",
              style: TextStyle(color: Color.fromARGB(255, 251, 20, 3)),
            ),
          ),
        ),
      ],
    );
  }

  Color _getBorderColor(EmailValidationState state) {
    switch (state) {
      case EmailValidationState.Valid:
        return Colors.green;
      case EmailValidationState.Invalid:
        return Colors.red;
      case EmailValidationState.None:
        return Colors.transparent;
    }
  }

  Widget _getSuffixIcon(EmailValidationState state) {
    switch (state) {
      case EmailValidationState.Valid:
        return const Icon(Icons.check);
      case EmailValidationState.Invalid:
        return const Icon(Icons.close);
      case EmailValidationState.None:
        return Container(); // Return an empty Container for EmailValidationState.None
    }
  }
}
