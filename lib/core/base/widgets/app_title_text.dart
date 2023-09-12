import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TitleText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:style??Theme.of(context).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.bold
      ),
    );
  }
}
