import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:get/get.dart";
import "package:mix/mix.dart";

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

      final Box finded =
          tester.widget<Box>(find.byKey(PrimaryButton.boxContainerKey));

      final Attribute? boxAttributes =
          finded.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as BoxAttributes).color != null;
        } catch (e) {
          return false;
        }
      });

      expect(
        (boxAttributes as BoxAttributes?)?.color,
        ThemeSAKS.colors.primary.sea,
      );

      final Attribute? opacityAttributes =
          finded.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as OpacityDecorator).opacity >= 0;
        } catch (e) {
          return false;
        }
      });

      expect(
        (opacityAttributes as OpacityDecorator?)?.opacity,
        1,
      );

      // testing padding
      final List<Attribute> listBoxAttributes =
          finded.mix.attributes.where((element) {
        try {
          return (element as BoxAttributes).padding != null;
        } catch (e) {
          return false;
        }
      }).toList();

      expect(
        (listBoxAttributes.first as BoxAttributes).padding?.left,
        15,
      );
      expect(
        (listBoxAttributes.first as BoxAttributes).padding?.right,
        15,
      );

      expect(
        (listBoxAttributes.last as BoxAttributes).padding?.top,
        9,
      );
      expect(
        (listBoxAttributes.last as BoxAttributes).padding?.bottom,
        9,
      );
    });

    testWidgets("should set correctly properties when it is disabled ",
        (tester) async {
      final widget = PrimaryButton(
        text: text,
        disabled: true,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Box finded =
          tester.widget<Box>(find.byKey(SecondaryButton.boxContainerKey));
      final Attribute? opacityAttributes =
          finded.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as OpacityDecorator).opacity >= 0;
        } catch (e) {
          return false;
        }
      });

      expect(
        (opacityAttributes as OpacityDecorator?)?.opacity,
        0.5,
      );
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
