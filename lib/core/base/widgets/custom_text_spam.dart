import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class CustomTextSpam extends StatelessWidget {
  final String startingValue;
  final String modifyValue;
  final String lastValue;

  const CustomTextSpam(
      {super.key,
      required this.startingValue,
      required this.modifyValue,
      required this.lastValue});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: startingValue,
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: modifyValue,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorPrimary,
            ),
          ),
          TextSpan(
            text: lastValue,
          ),
        ],
      ),
    );
  }
}
