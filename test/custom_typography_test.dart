import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "utils/test_wrappers.dart";

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
    const widget = CustomTypography(
      variant: TypographyVariant.h4,
      text: "This is a test",
    );

    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final Text findedWidget = tester.widget<Text>(find.byType(Text));

    expect(
      findedWidget.style?.fontSize,
      16,
    );
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
