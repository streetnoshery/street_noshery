import 'package:flutter/material.dart';
import 'package:street_noshery/common/common_theme.dart';

class SnackBarService {
  // Private constructor
  SnackBarService._();

  // Singleton instance
  static final SnackBarService _instance = SnackBarService._();

  // Get the instance
  static SnackBarService get instance => _instance;

  // A reference to the ScaffoldMessengerState
  ScaffoldMessengerState? scaffoldMessengerState;
  final theme = CommonTheme();

  // Method to show SnackBar
  void showSnackBar(String message, Color colorTheme) {
    scaffoldMessengerState?.showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: theme.theme.textPrimary, fontSize: 15)),
        backgroundColor: colorTheme,  // Customize the color
      ),
    );
  }
}
