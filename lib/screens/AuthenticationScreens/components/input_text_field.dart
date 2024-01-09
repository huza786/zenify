import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class InputTextField extends StatelessWidget {
  InputTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.textEditingController});
  TextEditingController textEditingController = TextEditingController();
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(.1), blurRadius: 1.2)
            ]),
        height: 60.h,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: headerStyle,
                labelText: labelText,
                labelStyle: headerStyle),
          ),
        ),
      ),
    );
  }
}
