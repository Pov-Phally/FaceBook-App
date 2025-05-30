import 'package:flutter/material.dart';
import 'dart:async';

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
    dynamic duration = false, // Default is false
  }) {
    if (_isAlertVisible) {
      debugPrint("AlertWidget: Alert is already visible.");
      return;
    }

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
                  if (onConfirm != null) {
                    onConfirm();
                  }
                  _isAlertVisible = false;
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('OK'),
              ),
          ],
        );
      },
    ).then((_) {
      _isAlertVisible = false; // Reset the flag when the dialog is dismissed
      debugPrint("AlertWidget: Alert dismissed.");
    });

    // Auto-dismiss if duration is provided and not false
    if (duration is Duration) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Timer(duration, () {
          if (_isAlertVisible &&
              Navigator.of(context, rootNavigator: true).canPop()) {
            _isAlertVisible = false;
            Navigator.of(context, rootNavigator: true).pop();
          }
        });
      });
    }
  }
}