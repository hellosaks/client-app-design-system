import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";
import "package:mix/mix.dart";

import "../../utils/test_wrappers.dart";

void main() {
  group("SpecialButtons", () {
    testWidgets("should render correctly", (tester) async {
      final widget = SpecialButton(
        label: "label",
        onPressed: () {},
        variant: SpecialButtonVariant.whatsapp,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(SpecialButton), findsOneWidget);
    });

    group("should render styles correctly", () {
      testWidgets("for whatsapp variant", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.whatsapp,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        final List<Attribute> attributes = findedWidget.mix.attributes;

        expect(
          (attributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.utility.conservative,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.customIconsProps!.icon == CustomIcons.icWhatsapp,
          ),
          findsOneWidget,
        );
      });

      testWidgets("for share variant", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.share,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        final List<Attribute> attributes = findedWidget.mix.attributes;

        expect(
          (attributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.primary.sea,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.customIconsProps!.icon == CustomIcons.icShare,
          ),
          findsOneWidget,
        );
      });

      testWidgets("for whatsapp variant when tapped", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.whatsapp,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        // initial state
        expect(
          find.byWidgetPredicate(
            (widget) => widget is AnimatedOpacity && widget.opacity == 1,
          ),
          findsOneWidget,
        );

        // press down button
        final actionPress = await tester.press(find.byType(SpecialButton));
        await tester.pump();

        expect(
          find.byWidgetPredicate(
            (widget) => widget is AnimatedOpacity && widget.opacity == 0.8,
          ),
          findsOneWidget,
        );

        // release press button
        await actionPress.up();
        await tester.pump();

        // verify return to initial state
        expect(
          find.byWidgetPredicate(
            (widget) => widget is AnimatedOpacity && widget.opacity == 1,
          ),
          findsOneWidget,
        );
      });

      testWidgets("for share variant when tapped", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.share,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(AnimatedOpacity), findsNothing);

        // initial state
        Box findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        List<Attribute> attributes = findedWidget.mix.attributes;

        expect(
          (attributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.primary.sea,
        );

        // press down button
        final actionPress = await tester.press(find.byType(SpecialButton));
        await tester.pump();

        findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        attributes = findedWidget.mix.attributes;

        expect(
          (attributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.secondary.stone,
        );

        // release press button
        await actionPress.up();
        await tester.pump();

        findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        attributes = findedWidget.mix.attributes;

        // verify return to initial state
        expect(
          (attributes[0] as BoxAttributes).color,
          ThemeSAKS.colors.primary.sea,
        );
      });

      testWidgets("for whatsapp variant when disabled", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.whatsapp,
          disabled: true,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(
          find.byWidgetPredicate(
            (widget) => widget is AnimatedOpacity && widget.opacity == 0.5,
          ),
          findsOneWidget,
        );
      });

      testWidgets("for share variant when disabled", (tester) async {
        final widget = SpecialButton(
          label: "label",
          onPressed: () {},
          variant: SpecialButtonVariant.share,
          disabled: true,
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        final findedWidget =
            tester.widget<Box>(find.byKey(SpecialButton.boxContainerKey));
        final List<Attribute> attributes = findedWidget.mix.attributes;

        expect((attributes[4] as OpacityDecorator).opacity, 0.5);
      });
    });

    testWidgets("dont call onPress when is disabled", (tester) async {
      bool pressed = false;
      final widget = SpecialButton(
        label: "label",
        onPressed: () {
          pressed = true;
        },
        variant: SpecialButtonVariant.whatsapp,
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      await tester.tap(find.byType(SpecialButton));
      await tester.pump();

      expect(pressed, true);
    });
  });
}
