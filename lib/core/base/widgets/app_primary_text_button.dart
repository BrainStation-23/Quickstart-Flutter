import 'package:flutter/material.dart';

class AppPrimaryTextButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final bool? isEnabled;
  final TextStyle? style;

  const AppPrimaryTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isEnabled == null || isEnabled == true ? onPressed : null,
      child: FittedBox(
        child: Text(
          title,
          style: style ??
              TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
