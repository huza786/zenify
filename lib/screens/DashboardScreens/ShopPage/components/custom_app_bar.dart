import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final Duration duration;

  const CustomAppBar(
      {super.key,
      required this.child,
      this.height = kToolbarHeight,
      required this.duration});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // color: Colors.amber,
      duration: duration,
      height: height,
      // color: Colors.amber,
      child: child,
    );
  }
}
