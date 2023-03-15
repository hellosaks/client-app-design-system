import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mix/mix.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("AuxiliarButton", () {
    testWidgets("should render correctly", (tester) async {
      final widget = AuxiliarButton(label: "label", onPressed: () {});

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(Pressable), findsOneWidget);
      expect(find.text("label"), findsOneWidget);
    });

    testWidgets("should call correctly onPressed", (tester) async {
      bool pressed = false;
      final widget = AuxiliarButton(
        label: "label",
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(AuxiliarButton));
      await tester.pumpAndSettle();

      expect(pressed, true);
    });

    testWidgets("should render correctly styles when is disabled",
        (tester) async {
      final widget = AuxiliarButton(
        label: "label",
        onPressed: () {},
        disabled: true,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final Pressable pressable = tester.widget(find.byType(Pressable));
      final List<Attribute> attributes = pressable.mix.attributes;

      expect((attributes[3] as OpacityDecorator).opacity, 0.5);
    });

    testWidgets("should render correctly styles when pressed", (tester) async {
      final widget = AuxiliarButton(
        label: "label",
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(Pressable));
      await tester.pump();

      final Pressable pressable = tester.widget(find.byType(Pressable));
      final List<Attribute> attributes = pressable.mix.attributes;

      // verify color on click
      expect(
        ((attributes[3] as VariantAttribute<Attribute>).attributes[0]
                as BoxAttributes)
            .color,
        ThemeSAKS.colors.secondary.bay,
      );

      await tester.pumpAndSettle();
    });

    testWidgets("dont call onPress when is disabled", (tester) async {
      bool pressed = false;
      final widget = AuxiliarButton(
        label: "label",
        onPressed: () {
          pressed = true;
        },
        disabled: true,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(AuxiliarButton));
      await tester.pumpAndSettle();

      expect(pressed, false);
    });
  });
}
