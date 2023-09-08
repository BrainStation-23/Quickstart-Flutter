import 'package:flutter/material.dart';

enum SnackBarMessageType { success, failure, info }

void showSnackBarMessage(
  BuildContext context,
  String message,
  SnackBarMessageType type,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: _getSnackBarColor(context, type),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Color _getSnackBarColor(BuildContext context, SnackBarMessageType type) {
  switch (type) {
    case SnackBarMessageType.success:
      return Theme.of(context).colorScheme.primary;
    case SnackBarMessageType.failure:
      return Theme.of(context).colorScheme.error;
    case SnackBarMessageType.info:
      return Theme.of(context).colorScheme.secondary;
  }
}
