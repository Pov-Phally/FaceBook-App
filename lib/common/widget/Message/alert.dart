import 'package:flutter/material.dart';

class AlertWidget {
  static bool _isAlertVisible = false;

  static void show({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool showConfirmButton = true,
    bool showCancelButton = true,
  }) {
    if (_isAlertVisible) return;

    _isAlertVisible = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            if (showCancelButton)
              TextButton(
                onPressed: () {
                  if (onCancel != null) onCancel();
                  _isAlertVisible = false;
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            if (showConfirmButton)
              TextButton(
                onPressed: () {
                  if (onConfirm != null) onConfirm();
                  _isAlertVisible = false;
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
          ],
        );
      },
    ).then((_) {
      _isAlertVisible = false; // Reset the flag when the dialog is dismissed
    });
  }
}