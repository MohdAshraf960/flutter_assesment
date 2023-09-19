import 'package:flutter/material.dart';

class AppSnackbar {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackbar(SnackBar snackBar) {
    scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static void showErrorSnackbar(String message) {
    showSnackbar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(message),
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
