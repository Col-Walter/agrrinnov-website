import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // === COLORS ===
  static const Color green = Color(0xFF1FA34A);
  static const Color greenLight = Color(0xFF27C55B);
  static const Color greenDark = Color(0xFF157A35);
  static const Color black = Color(0xFF111111);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color surfaceLight = Color(0xFF242424);
  static const Color yellow = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF6A00);
  static const Color orangeLight = Color(0xFFFF8534);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF8A8A8A);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyBorder = Color(0xFF2E2E2E);

  // Gradients
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF1FA34A), Color(0xFF27C55B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient orangeGradient = LinearGradient(
    colors: [Color(0xFFFF6A00), Color(0xFFFF8534)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient yellowGradient = LinearGradient(
    colors: [Color(0xFFFFC107), Color(0xFFFFD54F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF111111), Color(0xFF1A1A1A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // === TYPOGRAPHY ===
  static TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: white,
    height: 1.1,
    letterSpacing: -2,
  );

  static TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
    fontSize: 52,
    fontWeight: FontWeight.w700,
    color: white,
    height: 1.15,
    letterSpacing: -1.5,
  );

  static TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: white,
    height: 1.2,
    letterSpacing: -1,
  );

  static TextStyle get headlineLarge => GoogleFonts.plusJakartaSans(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: white,
    height: 1.25,
  );

  static TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: white,
    height: 1.3,
  );

  static TextStyle get bodyLarge => GoogleFonts.outfit(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Color(0xFFCCCCCC),
    height: 1.6,
  );

  static TextStyle get bodyMedium => GoogleFonts.outfit(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAAAAAA),
    height: 1.6,
  );

  static TextStyle get bodySmall => GoogleFonts.outfit(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF888888),
    height: 1.5,
  );

  static TextStyle get labelLarge => GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: 1.5,
  );

  static TextStyle get labelMedium => GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: white,
    letterSpacing: 1.2,
  );

  // === THEME DATA ===
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      colorScheme: const ColorScheme.dark(
        primary: green,
        secondary: orange,
        tertiary: yellow,
        surface: surface,
        onPrimary: white,
        onSecondary: white,
      ),
      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: white,
        displayColor: white,
      ),
    );
  }

  // === SPACING ===
  static const double spacingXS = 8;
  static const double spacingS = 16;
  static const double spacingM = 24;
  static const double spacingL = 48;
  static const double spacingXL = 80;
  static const double spacingXXL = 120;

  // === BORDER RADIUS ===
  static const double radiusS = 8;
  static const double radiusM = 16;
  static const double radiusL = 24;
  static const double radiusXL = 40;

  // === BREAKPOINTS ===
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1280;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double maxWidth(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w > 1440) return 1280;
    return w;
  }

  static double sectionPadding(BuildContext context) {
    if (isMobile(context)) return 24;
    if (isTablet(context)) return 48;
    return 80;
  }
}
