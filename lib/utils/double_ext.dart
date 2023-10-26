import "dart:math";

import "package:intl/intl.dart";

extension DoubleFormats on double {
  String formatAsPercentShort({
    bool hidden = false,
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.decimalPercentPattern(
      decimalDigits: decimalDigits,
    );

    final formatted = formatter.format(
      truncateToDecimalPlaces(this * 100, decimalDigits) / 100,
    );

    return formatted;
  }

  // Math.floor( value * 100) / 100 -> calc for 2 decimal places trunc
  double truncateToDecimalPlaces(double value, int fractionalDigits) =>
      (value * pow(10, fractionalDigits)).floor() / pow(10, fractionalDigits);
}
