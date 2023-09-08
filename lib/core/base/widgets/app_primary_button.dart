import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qs_flutter/core/values/app_colors.dart';

import '../../app_context.dart';
import '../../values/app_values.dart';

class AppPrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  bool? isEnabled;
  bool? isLoading;
  double? width;
  double? height;
  TextStyle? textStyle;

  AppPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isEnabled,
    this.isLoading,
    this.height,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const CircularProgressIndicator(
            color: AppColors.colorPrimary,
          )
        : SizedBox(
            height: height,
            width: width ?? MediaQuery.of(AppContext.context).size.width,
            child: CupertinoButton(
              padding: textStyle != null
                  ? const EdgeInsets.symmetric(
                      horizontal: 10, vertical: AppValues.halfPadding)
                  : null,
              color: Theme.of(context).colorScheme.primary,
              onPressed:
                  isEnabled == null || isEnabled == true ? onPressed : null,
              child: textStyle == null
                  ? FittedBox(
                      child: Text(
                        title,
                        style: textStyle ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  : Text(
                      title,
                      style: textStyle,
                    ),
            ),
          );
  }
}
