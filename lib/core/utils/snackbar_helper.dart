import 'package:flutter/material.dart';

class SnackBarHelper {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    if (scaffoldMessengerKey.currentState != null) {
      scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
      scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
