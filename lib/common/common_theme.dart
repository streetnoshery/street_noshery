import 'package:flutter/material.dart';

class CommonTheme {
  final theme = CommonPrivateTheme.instance;
}

class CommonPrivateTheme {
 // Private constructor
  CommonPrivateTheme._privateConstructor();

  // The single private static instance
  static final CommonPrivateTheme _instance = CommonPrivateTheme._privateConstructor();

  // Public getter to access the instance
  static CommonPrivateTheme get instance => _instance;

  // Define your colors
  final Color darkMossGreen = const Color(0xFF0F2A1D);
  final Color darkLeafGreen = const Color(0xFF375534);
  final Color lightMossgreen = const Color(0xFF6B9071);
  final Color lightLeafGreen = const Color(0xFFAEC3B0);
  final Color lightGreen = const Color(0xFFE3EED4);
  final Color textPrimary = const Color(0xFF000000);
  final Color textSecondary = const Color(0xFF424242);
  final Color textTer = const Color(0xFF9E9E9E);
  final Color greyTer = const Color(0xFFF5F5F5);
  final Color greySecondary = const Color(0xFF757575);
  final Color yellowStar = const Color(0xFFFFE135);
  final Color pageBackgroundColor = const Color(0xFFEEEEEE);
  final Color textGreen = const Color(0xFF2E7D32);
  final Color errorText = const Color(0xFF9A0E0B);
  final Color orangeAccent = const Color(0xFFFFAB40);
  final Color surface = const Color(0xFFFFFFFF);
}