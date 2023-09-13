import 'package:flutter/material.dart';
import 'package:qs_flutter/core/app_context.dart';
import 'package:qs_flutter/core/base/widgets/confirmation_dialouge.dart';

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
final isDarkMode = Theme.of(AppContext.context).brightness == Brightness.dark;

String formatDate(DateTime date) {
  if (date == null) {
    throw ArgumentError('Input is not a valid DateTime object.');
  }

  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final hours = date.hour;
  final minutes = date.minute;
  final month = months[date.month - 1];
  final day = date.day;
  final year = date.year;

  // Format the time as "hh:mm AM/PM"
  final timeFormat =
      '${hours > 12 ? hours - 12 : hours}:${minutes.toString().padLeft(2, '0')} ${hours < 12 ? 'AM' : 'PM'}';

  // Concatenate all the parts
  final formattedDate = '$timeFormat - $month $day, $year';
  return formattedDate;
}
String getDisplayDate(DateTime date) {
  if (date == null) {
    throw ArgumentError('Input is not a valid DateTime object.');
  }

  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final month = months[date.month - 1];
  final day = date.day;
  final year = date.year;

  // Concatenate all the parts
  final formattedDate = '$month $day, $year';
  return formattedDate;
}

String getDisplayTime(DateTime date) {
  if (date == null) {
    throw ArgumentError('Input is not a valid DateTime object.');
  }

  final hours = date.hour;
  final minutes = date.minute;
  // Format the time as "hh:mm AM/PM"
  final timeFormat =
      '${hours > 12 ? hours - 12 : hours}:${minutes.toString().padLeft(2, '0')} ${hours < 12 ? 'AM' : 'PM'}';

  // Concatenate all the parts
  return timeFormat;
}


void showConfirmationDialog<T>(
    {required BuildContext context,
    required String title,
    required T content,
    required Function() onConfirm,
    required Function() onCancel}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationDialog(
        title: title,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

