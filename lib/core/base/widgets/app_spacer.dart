import 'package:flutter/material.dart';

class AppSpacer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const AppSpacer({super.key, this.width, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 8,
      width: width,
      child: child,
    );
  }
}
