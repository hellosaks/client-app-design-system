import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "../utils/test_wrappers.dart";

void main() {
  testWidgets("Typography shown", (WidgetTester tester) async {
    const widget = CustomTypography(
      variant: TypographyVariant.h1,
      text: "This is a test",
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));

    expect(find.byType(CustomTypography), findsOneWidget);
  });

  testWidgets("Typography render correct color", (WidgetTester tester) async {
    const widget = CustomTypography(
      variant: TypographyVariant.h1,
      text: "This is a test",
      color: Colors.blue,
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final Text findedWidget = tester.widget<Text>(find.byType(Text));

    expect(
      findedWidget.style?.color,
      Colors.blue,
    );
  });

  testWidgets("Typography render correct variant", (WidgetTester tester) async {
    variantFont(int fs, TypographyVariant variant) =>
        {"font-size": fs, "variant": variant};

    final variants = [
      variantFont(28, TypographyVariant.h1),
      variantFont(24, TypographyVariant.h2),
      variantFont(18, TypographyVariant.h3),
      variantFont(16, TypographyVariant.h4),
      variantFont(14, TypographyVariant.h5),
      variantFont(12, TypographyVariant.h6),
      variantFont(10, TypographyVariant.h7),
      variantFont(18, TypographyVariant.t1),
      variantFont(16, TypographyVariant.t2),
      variantFont(14, TypographyVariant.t3),
      variantFont(12, TypographyVariant.t4),
    ];

    for (final variant in variants) {
      final widget = CustomTypography(
        variant: variant["variant"] as TypographyVariant,
        text: "This is a test",
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      final Text findedWidget = tester.widget<Text>(find.byType(Text));
      expect(findedWidget.style?.fontSize, variant["font-size"]);
    }
  });

  testWidgets("Typography render correct font weight",
      (WidgetTester tester) async {
    const widget = CustomTypography(
      variant: TypographyVariant.h1,
      text: "This is a test",
      weight: FontWeight.w600,
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final Text findedWidget = tester.widget<Text>(find.byType(Text));

    expect(
      findedWidget.style?.fontWeight,
      FontWeight.w600,
    );
  });

  testWidgets("Typography render correct font alignment",
      (WidgetTester tester) async {
    const widget = CustomTypography(
      variant: TypographyVariant.h1,
      text: "This is a test",
      align: TextAlign.justify,
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final Text findedWidget = tester.widget<Text>(find.byType(Text));

    expect(
      findedWidget.textAlign,
      TextAlign.justify,
    );
  });

  testWidgets("Typography display 'This is a test' correctly",
      (WidgetTester tester) async {
    const widget = CustomTypography(
      variant: TypographyVariant.h1,
      text: "This is a test",
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));

    expect(
      find.text("This is a test"),
      findsOneWidget,
    );
  });
}
