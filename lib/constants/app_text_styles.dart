import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  // Glovo font families
  static const String _glovoBlack = 'GlovoBlack';
  static const String _glovoBold = 'GlovoBold';
  static const String _glovoMedium = 'GlovoMedium';
  static const String _glovoBook = 'GlovoBook';

  // Logo style
  static const TextStyle logo = TextStyle(
    fontFamily: _glovoBold,
    fontSize: 40,
    color: Color(0xFF00A082),
  );

  // Headings
  static const TextStyle h1 = TextStyle(
    fontFamily: _glovoBlack,
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: _glovoBold,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: _glovoBold,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1A1A1A),
  );

  // Body
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _glovoMedium,
    fontSize: 16,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _glovoBook,
    fontSize: 14,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _glovoBook,
    fontSize: 12,
    color: Color(0xFF6B6B6B),
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontFamily: _glovoBook,
    fontSize: 11,
    color: Color(0xFF9B9B9B),
  );

  // Button
  static const TextStyle button = TextStyle(
    fontFamily: _glovoMedium,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFFFFFFFF),
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: _glovoMedium,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  // Category label
  static const TextStyle categoryLabel = TextStyle(
    fontFamily: _glovoMedium,
    fontSize: 12,
    color: Color(0xFF1A1A1A),
  );

  // Price styles
  static const TextStyle price = TextStyle(
    fontFamily: _glovoBold,
    fontSize: 14,
    color: Color(0xFF1A1A1A),
  );

  static const TextStyle priceOld = TextStyle(
    fontFamily: _glovoBook,
    fontSize: 12,
    color: Color(0xFF9B9B9B),
    decoration: TextDecoration.lineThrough,
  );

  // Navigation
  static const TextStyle navLabel = TextStyle(
    fontFamily: _glovoMedium,
    fontSize: 11,
  );

  // Address bar
  static const TextStyle addressBar = TextStyle(
    fontFamily: _glovoBold,
    fontSize: 16,
    color: Color(0xFF1A1A1A),
  );
}
