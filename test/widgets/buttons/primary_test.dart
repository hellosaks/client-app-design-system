import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  const text = "Button";

  void onPressed() {}
  group("Primary Button", () {
    testWidgets("should render correctly", (tester) async {
      final widget = PrimaryButton(text: text, onPressed: onPressed);

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(PrimaryButton), findsOneWidget);
    });

    testWidgets("should call correctly onPress", (tester) async {
      bool pressed = false;
      final widget = PrimaryButton(
        text: text,
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(PrimaryButton));
      expect(pressed, true);
    });

    testWidgets("should set correctly properties", (tester) async {
      final widget = PrimaryButton(
        text: text,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Container found =
          tester.widget<Container>(find.byKey(PrimaryButton.boxContainerKey));

      final BoxDecoration decoration = found.decoration! as BoxDecoration;

      expect(decoration.color, ThemeSAKS.colors.primary.sea);

      // testing padding
      expect(found.padding?.horizontal, 30);
      expect(found.padding?.vertical, 25);
    });

    testWidgets("should set correctly properties when it is disabled ",
        (tester) async {
      final widget = PrimaryButton(
        text: text,
        disabled: true,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Container found =
          tester.widget<Container>(find.byKey(SecondaryButton.boxContainerKey));

      final BoxDecoration decoration = found.decoration! as BoxDecoration;

      expect(decoration.color, ThemeSAKS.colors.primary.sea.withOpacity(0.5));
    });

    group("CTA variante", () {
      testWidgets("should render correctly", (tester) async {
        final widget = PrimaryButton(
          text: text,
          onPressed: onPressed,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final CustomTypography finded =
            tester.widget(find.byType(CustomTypography));

        expect(finded.text, text);
        expect(finded.variant, TypographyVariant.cta);
      });
    });
  });
}
