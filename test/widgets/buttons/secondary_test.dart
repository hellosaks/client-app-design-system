import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  const text = "Button";

  void onPressed() {}
  group("Secondary Button", () {
    testWidgets("should render correctly", (tester) async {
      final widget = SecondaryButton(text: text, onPressed: onPressed);

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(SecondaryButton), findsOneWidget);
    });

    testWidgets("should call correctly onPress", (tester) async {
      bool pressed = false;
      final widget = SecondaryButton(
        text: text,
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(SecondaryButton));
      expect(pressed, true);
    });

    testWidgets("should set correctly properties", (tester) async {
      final widget = SecondaryButton(
        text: text,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Container found =
          tester.widget<Container>(find.byKey(SecondaryButton.boxContainerKey));

      final BoxDecoration decoration = found.decoration! as BoxDecoration;

      expect(decoration.color, ThemeSAKS.colors.primary.saks);

      // testing padding
      expect(found.padding?.horizontal, 20);
      expect(found.padding?.vertical, 18);
    });

    testWidgets("should set correctly properties when it is disabled ",
        (tester) async {
      final widget = SecondaryButton(
        text: text,
        disabled: true,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(tester.widget<Opacity>(find.byType(Opacity)).opacity, 0.5);
    });
  });
}
