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
  final outlinedColor = ColorAttributesButton(
    bgColor: ThemeSAKS.colors.utility.aggressive,
    pressColor: ThemeSAKS.colors.special.rose,
    outsideColor: ThemeSAKS.colors.primary.saks,
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

      // testing color
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
        10,
      );
      expect(
        (listBoxAttributes.first as BoxAttributes).padding?.right,
        10,
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
      final widget = SecondaryButton(
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

    testWidgets("should set correctly properties with property selected",
        (tester) async {
      final widget = SecondaryButton(
        text: text,
        selected: true,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Box finded =
          tester.widget<Box>(find.byKey(SecondaryButton.boxContainerKey));

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
        10,
      );
      expect(
        (listBoxAttributes.first as BoxAttributes).padding?.right,
        10,
      );

      expect(
        (listBoxAttributes.last as BoxAttributes).padding?.top,
        6,
      );
      expect(
        (listBoxAttributes.last as BoxAttributes).padding?.bottom,
        6,
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

    testWidgets("should render outline color", (WidgetTester tester) async {
      final widget = SecondaryButton(
        onPressed: () {},
        colorAttributes: outlinedColor,
        text: text,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final SecondaryButton finded =
          tester.widget(find.byType(SecondaryButton));

      expect(
        finded.colorAttributes?.outsideColor,
        ThemeSAKS.colors.primary.saks,
      );
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

    testWidgets("should set correctly ", (tester) async {
      final widget = SecondaryButton(
        text: text,
        outlined: true,
        colorAttributes: ColorAttributesButton(
          pressColor: ThemeSAKS.colors.utility.aggressive,
          insideColor: ThemeSAKS.colors.special.rose,
        ),
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Box finded =
          tester.widget<Box>(find.byKey(SecondaryButton.boxContainerKey));

      // testing padding
      final List<Attribute> listBoxAttributes =
          finded.mix.attributes.where((element) {
        try {
          return (element as BoxAttributes).border != null;
        } catch (e) {
          return false;
        }
      }).toList();

      final border = (listBoxAttributes.first as BoxAttributes?)?.border;

      expect(border?.bottom?.width, 1);
      expect(border?.top?.width, 1);
      expect(border?.left?.width, 1);
      expect(border?.right?.width, 1);

      final borderStyle = (listBoxAttributes.last as BoxAttributes?)?.border;

      expect(borderStyle?.bottom?.color, ThemeSAKS.colors.grayscale.division);
      expect(borderStyle?.top?.color, ThemeSAKS.colors.grayscale.division);
      expect(borderStyle?.left?.color, ThemeSAKS.colors.grayscale.division);
      expect(borderStyle?.right?.color, ThemeSAKS.colors.grayscale.division);
    });
  });
}
