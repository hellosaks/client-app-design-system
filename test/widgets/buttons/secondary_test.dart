import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/buttons/color_attributes.dart";
import "package:flutter_test/flutter_test.dart";
import "package:get/get.dart";
import "package:mix/mix.dart";

import "../../utils/test_wrappers.dart";

void main() {
  const text = "Button";

  final withSeaColorProps = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.primary.sea,
    pressColor: ThemeSAKS.colors.secondary.anchor,
  );

  final withDangerColorProps = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.utility.aggressive,
    pressColor: ThemeSAKS.colors.special.rose,
  );

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

      final Box finded =
          tester.widget<Box>(find.byKey(SecondaryButton.boxContainerKey));

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
        ThemeSAKS.colors.primary.saks,
      );
    });
  });

  group("SecondaryButton variant colors", () {
    testWidgets("should render SEA color", (WidgetTester tester) async {
      final widget = SecondaryButton(
        onPressed: () {},
        colorAttributes: withSeaColorProps,
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final SecondaryButton finded =
          tester.widget(find.byType(SecondaryButton));

      expect(finded.colorAttributes?.bgColor, ThemeSAKS.colors.primary.sea);
      expect(
        finded.colorAttributes?.pressColor,
        ThemeSAKS.colors.secondary.anchor,
      );
    });

    testWidgets("should render DANGER color", (WidgetTester tester) async {
      final widget = SecondaryButton(
        onPressed: () {},
        colorAttributes: withDangerColorProps,
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final SecondaryButton finded =
          tester.widget(find.byType(SecondaryButton));
      expect(
        finded.colorAttributes?.bgColor,
        ThemeSAKS.colors.utility.aggressive,
      );
      expect(finded.colorAttributes?.pressColor, ThemeSAKS.colors.special.rose);
    });
  });

  group("Outlined", () {
    testWidgets("should render correctly", (tester) async {
      final widget = SecondaryButton(
        text: text,
        onPressed: onPressed,
        outlined: true,
        colorAttributes: ColorAttributesButton(
          pressColor: ThemeSAKS.colors.utility.aggressive,
          insideColor: ThemeSAKS.colors.special.rose,
        ),
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(SecondaryButton), findsOneWidget);
    });
  });
}
