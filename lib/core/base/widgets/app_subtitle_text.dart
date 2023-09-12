import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const SubtitleText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style??Theme.of(context).textTheme.labelMedium,
    );
  }
}
