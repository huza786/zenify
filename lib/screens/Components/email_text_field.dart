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
  // ignore: library_private_types_in_public_api
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
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
                color: Provider.of<EmailState>(context).isValidEmail
                    ? Colors.green
                    : Colors.transparent,
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
                  suffixIcon: Provider.of<EmailState>(context).isValidEmail
                      ? const Icon(Icons.check)
                      : const Icon(Icons.close),
                  hintText: widget.hintText,
                  hintStyle: headerStyle,
                  labelText: widget.labelText,
                  labelStyle: headerStyle,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (!Provider.of<EmailState>(context).isValidEmail) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        Visibility(
          visible: !Provider.of<EmailState>(context).isValidEmail,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.h, 0, 0, 10.h),
            child: const Text(
              """Not a valid email address.Should be 'your@email.com'""",
              style: TextStyle(color: Color.fromARGB(255, 251, 20, 3)),
            ),
          ),
        ),
      ],
    );
  }
}
