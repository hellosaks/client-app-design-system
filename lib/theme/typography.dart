import "package:client_app_design_system/utils/constants.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:mix/mix.dart";

class Typography {
  /// Font used in project
  final fontPlusJakartaTextTheme = GoogleFonts.plusJakartaSansTextTheme;
  final fontPlusJakarta = GoogleFonts.plusJakartaSans;

  static final _defaultFont =
      Mix(textStyle(const TextStyle(fontFamily: Constants.fontFamily)));

  final double textScaleFactor = 1.0;

  final h1Typo = Mix.combine(_defaultFont, Mix(fontSize(24)));
  final h2Typo = Mix.combine(_defaultFont, Mix(fontSize(22)));
  final h3Typo = Mix.combine(_defaultFont, Mix(fontSize(20)));
  final h4Typo = Mix.combine(_defaultFont, Mix(fontSize(18)));
  final h5Typo = Mix.combine(_defaultFont, Mix(fontSize(16)));
  final h6Typo = Mix.combine(_defaultFont, Mix(fontSize(14)));
  final h7Typo = Mix.combine(_defaultFont, Mix(fontSize(12)));

  final ctaTypo = Mix.combine(
    _defaultFont,
    Mix(fontSize(14), fontWeight(FontWeight.w800), letterSpacing(2)),
  );
  final underlineTypo = Mix.combine(
    _defaultFont,
    Mix(
      fontSize(14),
      fontWeight(FontWeight.w700),
      textStyle(const TextStyle(decoration: TextDecoration.underline)),
    ),
  );
  final strikethroughTypo = Mix.combine(
    _defaultFont,
    Mix(
      fontSize(14),
      fontWeight(FontWeight.w700),
      textStyle(const TextStyle(decoration: TextDecoration.lineThrough)),
    ),
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
