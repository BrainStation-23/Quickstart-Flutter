import 'package:flutter/material.dart';

class ConfirmationDialog<T> extends StatelessWidget {
  final String title;
  final T? content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmationDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content:
          (content is String) ? Text(content.toString()) : (content as Widget),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onCancel();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

