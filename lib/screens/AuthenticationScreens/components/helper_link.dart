import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zenify/utils/globalvariable.dart';

class HelperLinkWidget extends StatelessWidget {
  final String helperText;
  VoidCallback? navigationfunction;

  Widget? icon = Container();
  int leftPadding;
  HelperLinkWidget(
      {super.key,
      required this.helperText,
      this.icon,
      required this.navigationfunction,
      required this.leftPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(leftPadding.w, 0, 0, 0),
      child: TextButton(
          onPressed: () {
            navigationfunction?.call();
          },
          child: Row(
            children: [
              Text(
                helperText,
                style: headerStyle,
              ),
              icon!
            ],
          )),
    );
  }
}
