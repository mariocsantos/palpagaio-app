import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF4e39b8),
  primary: const Color(0xFF4e39b8),
  onPrimary: Colors.white,
  primaryContainer: const Color(0xFF7361df),
  onPrimaryContainer: Colors.white,
  secondary: const Color(0xFF006c47),
  onSecondary: Colors.white,
  secondaryContainer: const Color(0xFF69fdba),
  onSecondaryContainer: const Color(0xFF005336),
);

ThemeData themeData = ThemeData(
  colorScheme: colorScheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorScheme.secondaryContainer,
    foregroundColor: colorScheme.onSecondaryContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
  ),
);
