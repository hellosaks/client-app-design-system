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
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 28 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });

  test("Typography theme h2 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h2Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 24 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme h3 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h3Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 18 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme h4 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h4Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 16 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme h5 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h5Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 14 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme h6 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h6Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 12 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme h7 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.h7Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 10 ||
              e.style?.letterSpacing == 0.23,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });

  test("Typography theme t1 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.t1Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 18 ||
              e.style?.letterSpacing == 2,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme t2 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.t2Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 16 ||
              e.style?.letterSpacing == 2,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme t3 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.t3Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 14 ||
              e.style?.letterSpacing == 2,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
  test("Typography theme t4 correct attributes", () {
    final List<TextAttributes> attr = ThemeSAKS.typography.t4Typo.attributes;

    final List<bool> isFontOk = attr
        .map(
          (e) =>
              e.style?.fontFamily == "montserrat" ||
              e.style?.fontSize == 12 ||
              e.style?.letterSpacing == 2,
        )
        .toList();

    expect(isFontOk, [true, true, true]);
  });
}
