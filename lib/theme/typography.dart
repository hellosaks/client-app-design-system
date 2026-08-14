import "package:client_app_design_system/utils/constants.dart";
import "package:flutter/material.dart" as flutter;
import "package:google_fonts/google_fonts.dart";
import "package:material_ui/material_ui.dart";

class Typography {
  /// Font used in project
  final flutter.TextTheme Function(flutter.TextTheme?) fontPlusJakartaTextTheme =
      GoogleFonts.plusJakartaSansTextTheme;
  static const fontPlusJakarta = GoogleFonts.plusJakartaSans;

  /// Applies the Plus Jakarta Sans font to a Material UI [TextTheme],
  /// preserving its original style values.
  TextTheme applyPlusJakartaFont(TextTheme textTheme) {
    final result = fontPlusJakartaTextTheme(_fromMaterialUi(textTheme));
    return _toMaterialUi(result);
  }

  static const _defaultFont = TextStyle(fontFamily: Constants.fontFamily);

  final double textScaleFactor = 1.0;

  final h1Typo = _defaultFont.copyWith(fontSize: 24);
  final h1TypoF = fontPlusJakarta(fontSize: 24);
  final h2Typo = _defaultFont.copyWith(fontSize: 22);
  final h2TypoF = fontPlusJakarta(fontSize: 22);
  final h3Typo = _defaultFont.copyWith(fontSize: 20);
  final h3TypoF = fontPlusJakarta(fontSize: 20);
  final h4Typo = _defaultFont.copyWith(fontSize: 18);
  final h4TypoF = fontPlusJakarta(fontSize: 18);
  final h5Typo = _defaultFont.copyWith(fontSize: 16);
  final h5TypoF = fontPlusJakarta(fontSize: 16);
  final h6Typo = _defaultFont.copyWith(fontSize: 14);
  final h6TypoF = fontPlusJakarta(fontSize: 14);
  final h7Typo = _defaultFont.copyWith(fontSize: 12);
  final h7TypoF = fontPlusJakarta(fontSize: 12);

  final ctaTypo = _defaultFont.copyWith(
      fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 2,);

  final ctaTypoF = fontPlusJakarta(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    letterSpacing: 2,
  );

  final underlineTypo = _defaultFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  final underlineTypoF = fontPlusJakarta(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.underline,
  );

  final strikethroughTypo = _defaultFont.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.lineThrough,
  );

  final strikethroughTypoF = fontPlusJakarta(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.lineThrough,
  );

  final inputTypo = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    letterSpacing: 0.23,
  );

  final helperTextTypo = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    letterSpacing: 0.23,
  );

  final termsUseTypo =
      const TextStyle(fontFamily: Constants.fontFamily, fontSize: 16);

  final otpInputTypo = GoogleFonts.plusJakartaSans(fontSize: 16);

  final boldTypo = const TextStyle(
    fontFamily: Constants.fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}

flutter.TextTheme _fromMaterialUi(TextTheme textTheme) => flutter.TextTheme(
      displayLarge: textTheme.displayLarge,
      displayMedium: textTheme.displayMedium,
      displaySmall: textTheme.displaySmall,
      headlineLarge: textTheme.headlineLarge,
      headlineMedium: textTheme.headlineMedium,
      headlineSmall: textTheme.headlineSmall,
      titleLarge: textTheme.titleLarge,
      titleMedium: textTheme.titleMedium,
      titleSmall: textTheme.titleSmall,
      bodyLarge: textTheme.bodyLarge,
      bodyMedium: textTheme.bodyMedium,
      bodySmall: textTheme.bodySmall,
      labelLarge: textTheme.labelLarge,
      labelMedium: textTheme.labelMedium,
      labelSmall: textTheme.labelSmall,
    );

TextTheme _toMaterialUi(flutter.TextTheme textTheme) => TextTheme(
      displayLarge: textTheme.displayLarge,
      displayMedium: textTheme.displayMedium,
      displaySmall: textTheme.displaySmall,
      headlineLarge: textTheme.headlineLarge,
      headlineMedium: textTheme.headlineMedium,
      headlineSmall: textTheme.headlineSmall,
      titleLarge: textTheme.titleLarge,
      titleMedium: textTheme.titleMedium,
      titleSmall: textTheme.titleSmall,
      bodyLarge: textTheme.bodyLarge,
      bodyMedium: textTheme.bodyMedium,
      bodySmall: textTheme.bodySmall,
      labelLarge: textTheme.labelLarge,
      labelMedium: textTheme.labelMedium,
      labelSmall: textTheme.labelSmall,
    );
