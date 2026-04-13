import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFD81B60);
  static const Color primaryDark = Color(0xFFAD1457);
  static const Color accent = Color(0xFF9C27B0);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFD81B60), Color(0xFF8E24AA)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color background = Color(0xFFFFFFFF);
  static const Color scaffoldBg = Color(0xFFF7F7F7);
  static const Color card = Color(0xFFF2F2F2);

  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF6E6E6E);
  static const Color textLight = Color(0xFF9E9E9E);

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  static const Color selected = Color(0xFFD81B60);
  static const Color unselected = Color(0xFFBDBDBD);

  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ColorStyle {
  static const Color scaffoldBg = Color(0xFFF9F9F9);
  static const Color primary = Color(0xFFC23E91);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color border = Color(0xFFE0E0E0);
  static const Color cardBg = Color(0xFFFFFFFF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFC23E91), Color(0xFFE55EAB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static Color verifiedBoxBg = const Color(0xFFF1F1F1).withOpacity(0.5);
}
