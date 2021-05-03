import 'package:flutter/material.dart';
import 'app_theme_data.dart';

class AppColorScheme {
  static ColorScheme get colorScheme =>
      AppThemeData.isDark ? colorSchemeDark : colorSchemeLight;

  static final ColorScheme colorSchemeLight = ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Color(0xff32353D),
    accentColor: accentColor,
    primarySwatch: primarySwatch,
    errorColor: Color(0xFFFF6565),
  ).copyWith(
    onPrimary: white,
  );

  static final ColorScheme colorSchemeDark = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Color(0xff32353D),
    accentColor: accentColor,
    primarySwatch: primarySwatch,
    errorColor: Color(0xFFFF6565),
  ).copyWith(
    onPrimary: white,
  );

  static const MaterialColor grey =
  const MaterialColor(0xff9B9B9B, <int, Color>{
    100: Color(0xffF0F0F0),
    200: Color(0xffE8E8E8),
    300: grey300,
    400: shadowColorDark,
    500: Color(0xff9B9B9B),
  });

  static const Color grey300 = const Color(0xffDBDBDB);

  static const MaterialColor orange = MaterialColor(0xffFFAD29, <int, Color>{
    500: Color(0xffFFAD29),
  });

  static const Color shadowColorDark = Color(0xffd9d9d9);

  /// http://mcg.mbitson.com/
  static const MaterialColor primarySwatch =
  const MaterialColor(0xFF21C99F, <int, Color>{
    50: primarySwatch50,
    100: Color(0xFFBCEFE2),
    200: Color(0xFF90E4CF),
    300: Color(0xFF64D9BC),
    400: Color(0xFF42D1AD),
    500: Color(0xFF21C99F),
    600: Color(0xFF1DC397),
    700: Color(0xFF18BC8D),
    800: Color(0xFF14B583),
    900: Color(0xFF0BA972),
  });

  static const Color primarySwatch50 = const Color(0xFFE8FAF5);

  static const MaterialColor accentColor =
  MaterialColor(0xFF21C99F, <int, Color>{
    100: Color(0xFFD6FFEF),
    200: Color(0xFF21C99F),
    400: Color(0xFF70FFC8),
    700: Color(0xFF57FFBE),
  });

  static const Color black = const Color(0xff000000);
  static const Color white = const Color(0xffFFFFFF);
}
