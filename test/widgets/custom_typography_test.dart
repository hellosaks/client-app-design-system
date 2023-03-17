import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mix/mix.dart";

void main() {
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  test("Typography theme h1 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h1Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 24,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });

  test("Typography theme h2 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h2Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 22,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });
  test("Typography theme h3 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h3Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 20,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });
  test("Typography theme h4 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h4Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 18,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });
  test("Typography theme h5 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h5Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 16,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });
  test("Typography theme h6 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h6Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 14,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });
  test("Typography theme h7 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h7Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 12,
        )
        .toList();

    expect(isFontOk, [true, true]);
  });

  test("Typography theme cta correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.ctaTypo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 14 ||
              e.style?.fontWeight == FontWeight.w800 ||
              e.style?.letterSpacing == 2,
        )
        .toList();

    expect(isFontOk, [true, true, true, true]);
  });
  test("Typography theme underline correct attributes", () {
    final List<TextAttributes> attr =
        ThemeSAKS.typography.underlineTypo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 14 ||
              e.style?.fontWeight == FontWeight.w700 ||
              e.style?.decoration == TextDecoration.underline,
        )
        .toList();

    expect(isFontOk, [true, true, true, true]);
  });
  test("Typography theme strikethrough correct attributes", () {
    final List<TextAttributes> attr =
        ThemeSAKS.typography.strikethroughTypo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "plus_jakarta_sans" ||
              e.style?.fontSize == 14 ||
              e.style?.fontWeight == FontWeight.w700 ||
              e.style?.decoration == TextDecoration.lineThrough,
        )
        .toList();

    expect(isFontOk, [true, true, true, true]);
  });
}
