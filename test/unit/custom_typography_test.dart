import "package:client_app_design_system/theme/theme_saks.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  setUpAll(WidgetsFlutterBinding.ensureInitialized);

  test("Typography theme h1 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h1Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 24);
  });

  test("Typography theme h2 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h2Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 22);
  });

  test("Typography theme h3 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h3Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 20);
  });

  test("Typography theme h4 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h4Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 18);
  });

  test("Typography theme h5 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h5Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 16);
  });

  test("Typography theme h6 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h6Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 14);
  });

  test("Typography theme h7 correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.h7Typo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 12);
  });

  test("Typography theme cta correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.ctaTypo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 14);
    expect(style.fontWeight, FontWeight.w800);
    expect(style.letterSpacing, 2);
  });

  test("Typography theme underline correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.underlineTypo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 14);
    expect(style.fontWeight, FontWeight.w700);
    expect(style.decoration, TextDecoration.underline);
  });

  test("Typography theme strikethrough correct attributes", () {
    final TextStyle style = ThemeSAKS.typography.strikethroughTypo;

    expect(style.fontFamily, "plus_jakarta_sans");
    expect(style.fontSize, 14);
    expect(style.fontWeight, FontWeight.w700);
    expect(style.decoration, TextDecoration.lineThrough);
  });
}
