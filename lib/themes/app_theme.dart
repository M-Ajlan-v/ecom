// app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Main Brand
  static const Color primary = Color(0xFFFF6A00);
  static const Color primaryRed = Color(0xFFFF0000);

  // Backgrounds
  static const Color scaffoldBg = Color(0xFFF3F3F3);
  static const Color white = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF0B1B3B);
  static const Color textSecondary = Color(0xFF6B7280);

  // Borders
  static const Color border = Color(0xFFE5E7EB);

  // Search
  static const Color searchBg = Color(0xFFF8F8F8);

  // Bottom Nav
  static const Color navInactive = Color(0xFF7B8190);

  // Category Backgrounds
  static const Color engineBg = Color(0xFFE8F0FF);
  static const Color brakeBg = Color(0xFFFFEAEA);
  static const Color electricalBg = Color(0xFFFFF3CC);
  static const Color suspensionBg = Color(0xFFF3E8FF);
  static const Color bodyBg = Color(0xFFE7F8EC);
  static const Color interiorBg = Color(0xFFE8EBFF);

  // Category Icon Colors
  static const Color engineIcon = Color(0xFF2563EB);
  static const Color brakeIcon = Color(0xFFEF4444);
  static const Color electricalIcon = Color(0xFFD97706);
  static const Color suspensionIcon = Color(0xFF9333EA);
  static const Color bodyIcon = Color(0xFF16A34A);
  static const Color interiorIcon = Color(0xFF4F46E5);

  static const LinearGradient saleGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFF6A00),
      Color(0xFFFF0000),
    ],
  );

  static ThemeData light = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: scaffoldBg,

    textTheme: GoogleFonts.poppinsTextTheme(),

    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
    ),

    cardColor: white,

    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldBg,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}