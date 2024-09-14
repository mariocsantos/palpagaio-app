import 'package:flutter/material.dart';
import 'package:palpagaio/theme/colors.dart';

ColorScheme colorScheme = const ColorScheme.light(
  primary: Color(0xFF57CC05),
  onPrimary: Colors.white,
  primaryContainer: Color(0xFFE8F8DD),
  onPrimaryContainer: Color(0xFF57CC05),
  secondary: Color(0xFF57CC05),
  onSecondary: Colors.white,
  secondaryContainer: Color(0xFFE8F8DD),
  onSecondaryContainer: Color(0xFF57CC05),
  tertiary: Color(0xFF57CC05),
  onTertiary: Colors.white,
  tertiaryContainer: Color(0xFFE8F8DD),
  onTertiaryContainer: Color(0xFF57CC05),
  surface: Color(0xFFFCF8F8),
  onSurface: Color(0xFF1C1B1B),
  onSurfaceVariant: Color(0xFF444748),
  outline: Color(0xFF747878),
  outlineVariant: Color(0xFFC4C7C8),
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF313030),
  surfaceDim: Color(0xFFDDD9D9),
  surfaceBright: Color(0xFFFCF8F8),
  surfaceContainerLowest: Color(0xFFFFFFFF),
  surfaceContainerLow: Color(0xFFF6F3F2),
  surfaceContainer: Color(0xFFF1EDEC),
  surfaceContainerHigh: Color(0xFFEBE7E7),
  surfaceContainerHighest: Color(0xFFE5E2E1),
);

ThemeData themeData = ThemeData(
  colorScheme: colorScheme,
  extensions: const <ThemeExtension<dynamic>>[
    BubbleColors(
      bubble: Color(0xFF6FD325),
      onBubble: Colors.white,
    )
  ],
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: colorScheme.secondaryContainer,
    foregroundColor: colorScheme.onSecondaryContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.onSurface,
      ),
    ),
    labelStyle: TextStyle(
      color: colorScheme.outline,
    ),
    floatingLabelStyle: TextStyle(
      color: colorScheme.onSurface,
    ),
  ),
);
