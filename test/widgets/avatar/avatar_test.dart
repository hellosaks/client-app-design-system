import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  testWidgets("Avatar is shown", (WidgetTester tester) async {
    // GIVEN
    final widget = Avatar(onPressed: () {});

    // WHEN
    await tester.pumpWidget(wrapWithMaterialApp(widget));

    // THEN
    expect(find.byType(Avatar), findsOneWidget);
  });

  testWidgets("Avatar should render correct background color",
      (WidgetTester tester) async {
    // GIVEN
    final widget = Avatar(onPressed: () {});

    // WHEN
    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final DecoratedBox result = tester.firstWidget(find.byType(DecoratedBox));

    // THEN
    expect(
      (result.decoration as BoxDecoration).color,
      ThemeSAKS.colors.secondary.ice,
    );
  });

  testWidgets("Avatar should render default radius",
      (WidgetTester tester) async {
    // GIVEN
    final widget = Avatar(onPressed: () {});

    // WHEN
    await tester.pumpWidget(wrapWithMaterialApp(widget));
    final CircleAvatar finded = tester.firstWidget(find.byType(CircleAvatar));

    expect(finded.radius, 22);
  });

  testWidgets("Avatar should correctly call onPressed",
      (WidgetTester tester) async {
    // GIVEN
    bool pressed = false;
    final widget = Avatar(
      onPressed: () {
        pressed = true;
      },
    );

    // WHEN
    await tester.pumpWidget(wrapWithMaterialApp(widget));
    await tester.tap(find.byType(Avatar));
    await tester.pumpAndSettle();

    // THEN
    expect(pressed, true);
  });
}
