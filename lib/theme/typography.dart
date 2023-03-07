import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:mix/mix.dart";

class Typography {
  /// Font used in project
  final fontPlusJakartaTextTheme = GoogleFonts.plusJakartaSansTextTheme;
  final fontPlusJakarta = GoogleFonts.plusJakartaSans;

  static final _defaultFont = Mix(
    textStyle(const TextStyle(fontFamily: "plus_jakarta_sans")),
  );

  final double textScaleFactor = 1.0;

  final h1Typo =
      Mix.combine(_defaultFont, Mix(fontSize(28), letterSpacing(0.23)));
  final h2Typo =
      Mix.combine(_defaultFont, Mix(fontSize(24), letterSpacing(0.23)));
  final h3Typo =
      Mix.combine(_defaultFont, Mix(fontSize(18), letterSpacing(0.23)));
  final h4Typo =
      Mix.combine(_defaultFont, Mix(fontSize(16), letterSpacing(0.23)));
  final h5Typo =
      Mix.combine(_defaultFont, Mix(fontSize(14), letterSpacing(0.23)));
  final h6Typo =
      Mix.combine(_defaultFont, Mix(fontSize(12), letterSpacing(0.23)));
  final h7Typo =
      Mix.combine(_defaultFont, Mix(fontSize(10), letterSpacing(0.23)));

  final t1Typo = Mix.combine(_defaultFont, Mix(fontSize(18), letterSpacing(2)));
  final t2Typo = Mix.combine(_defaultFont, Mix(fontSize(16), letterSpacing(2)));
  final t3Typo = Mix.combine(_defaultFont, Mix(fontSize(14), letterSpacing(2)));
  final t4Typo = Mix.combine(_defaultFont, Mix(fontSize(12), letterSpacing(2)));

  final inputTypo = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    letterSpacing: 0.23,
  );

  final helperTextTypo = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    letterSpacing: 0.23,
  );

  final termsUseTypo = const TextStyle(
    fontFamily: "plus_jakarta_sans",
    fontSize: 16,
  );

  final otpInputTypo = GoogleFonts.plusJakartaSans(
    fontSize: 16,
  );

  final boldTypo = const TextStyle(
    fontFamily: "plus_jakarta_sans",
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );
}
