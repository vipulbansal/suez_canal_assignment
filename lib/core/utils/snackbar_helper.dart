import 'package:flutter/material.dart';

class SnackBarHelper {
  // Global key for ScaffoldMessenger
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  // Method to show SnackBar with a message
  static void showSnackBar(String message) {
    // Check if the current ScaffoldMessenger exists
    if (scaffoldMessengerKey.currentState != null) {
      // Hide any currently visible SnackBar
      scaffoldMessengerKey.currentState!.hideCurrentSnackBar();

      // Show the new SnackBar
      scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
