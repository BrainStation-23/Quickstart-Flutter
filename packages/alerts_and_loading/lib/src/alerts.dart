import 'package:flutter/material.dart';

///[Alert] class can be used for showing many kinds of alerts and dialog
///Please implement [SuccessAlert], [ErrorAlert] and other necessary alerts according to your need
///If you don't need any particular types of alert, please don't implement it

sealed class Alert {
  const Alert();

  factory Alert.success({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText,
    required VoidCallback onConfirm,
  }) = SuccessAlert;

  factory Alert.error({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText,
    required VoidCallback onConfirm,
  }) = ErrorAlert;

  factory Alert.warning({
    required BuildContext context,
    required String title,
    required String content,
    required String confirmText,
    required VoidCallback onConfirm,
  }) = WarningAlert;

  factory Alert.info({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText,
    required VoidCallback onConfirm,
  }) = InfoAlert;

  factory Alert.confirmation({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText,
    String cancelText,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) = ConfirmationAlert;

  void show();
}

class SuccessAlert extends Alert {
  final BuildContext context;
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const SuccessAlert({
    required this.context,
    required this.title,
    required this.content,
    this.confirmText = "OK",
    required this.onConfirm,
  });

  @override
  void show() {
    throw UnimplementedError();
  }
}

class ErrorAlert extends Alert {
  final BuildContext context;
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const ErrorAlert({
    required this.context,
    required this.title,
    required this.content,
    this.confirmText = "OK",
    required this.onConfirm,
  });

  @override
  void show() {
    throw UnimplementedError();
  }
}

class WarningAlert extends Alert {
  final BuildContext context;
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const WarningAlert({
    required this.context,
    required this.title,
    required this.content,
    this.confirmText = "OK",
    required this.onConfirm,
  });
  @override
  void show() {
    throw UnimplementedError();
  }
}

class InfoAlert extends Alert {
  final BuildContext context;
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const InfoAlert({
    required this.context,
    required this.title,
    required this.content,
    this.confirmText = "OK",
    required this.onConfirm,
  });

  @override
  void show() {
    throw UnimplementedError();
  }
}

class ConfirmationAlert extends Alert {
  final BuildContext context;
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationAlert({
    required this.context,
    required this.title,
    required this.content,
    this.confirmText = "Yes",
    this.cancelText = "No",
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  void show() {
    throw UnimplementedError();
  }
}
