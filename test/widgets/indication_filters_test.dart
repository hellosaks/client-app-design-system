import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";
import "package:get/get.dart";
import "package:mix/mix.dart";

import "../utils/test_wrappers.dart";

void main() {
  group("IndicationFilters", () {
    testWidgets(
      "render component",
      (WidgetTester tester) async {
        final widget = IndicationFilters(
          text: "Pendentes",
          filter: Filter.pending,
          number: 2,
          onPressed: () {},
        );

        await tester.pumpWidget(wrapWithMaterialApp(widget));

        expect(find.byType(IndicationFilters), findsOneWidget);
      },
    );

    testWidgets("onPressed called on tap card", (WidgetTester tester) async {
      bool pressed = false;
      final widget = IndicationFilters(
        isSelected: true,
        text: "Pendentes",
        filter: Filter.pending,
        number: 2,
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.tap(find.byType(IndicationFilters));
      await tester.pumpAndSettle();
      expect(pressed, true);

      final finded = tester.widget<VBox>(find.byKey(IndicationFilters.vboxKey));

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
        ThemeSAKS.colors.primary.sea.withOpacity(0.15),
      );
    });

    testWidgets("expected texts", (WidgetTester tester) async {
      final widget = IndicationFilters(
        text: "Pendentes",
        filter: Filter.pending,
        number: 2,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));

      await tester.pumpAndSettle();
      expect(find.text("Pendentes"), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
    });

    testWidgets("expected  attributes", (WidgetTester tester) async {
      final widget = IndicationFilters(
        text: "Pendentes",
        filter: Filter.pending,
        number: 2,
        onPressed: () {},
      );

      await tester.pumpWidget(wrapWithMaterialApp(widget));
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Pendentes" &&
              widget.color == ThemeSAKS.colors.primary.sea &&
              widget.weight == FontWeight.bold &&
              widget.variant == TypographyVariant.h4,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "2" &&
              widget.color == ThemeSAKS.colors.special.leaf &&
              widget.weight == FontWeight.bold &&
              widget.variant == TypographyVariant.h4,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Icon &&
              widget.props.heroIconsProps!.icon == HeroIcons.arrowRightCircle &&
              widget.props.heroIconsProps!.size == 24 &&
              widget.props.heroIconsProps!.color ==
                  ThemeSAKS.colors.primary.sea,
        ),
        findsOneWidget,
      );

      final circle =
          tester.widget<Box>(find.byKey(IndicationFilters.circleKey));
      final List<Attribute> attributes = circle.mix.attributes;
      expect(
        (attributes[2] as BoxAttributes).color,
        ThemeSAKS.colors.primary.sea,
      );

      final Pressable vbox =
          tester.widget(find.byKey(IndicationFilters.pressableKey));

      final Attribute? boxAttributes =
          vbox.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as BoxAttributes).color != null;
        } catch (e) {
          return false;
        }
      });
      expect(
        (boxAttributes as BoxAttributes?)?.color,
        ThemeSAKS.colors.primary.sky,
      );
    });

    testWidgets("Filter.activated attributes", (WidgetTester tester) async {
      final widget = IndicationFilters(
        text: "Ativo",
        filter: Filter.activated,
        number: 1,
        onPressed: () {},
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      final circle =
          tester.widget<Box>(find.byKey(IndicationFilters.circleKey));
      final List<Attribute> attributes = circle.mix.attributes;
      expect(
        (attributes[2] as BoxAttributes).color,
        ThemeSAKS.colors.utility.conservative,
      );

      final Pressable vbox =
          tester.widget(find.byKey(IndicationFilters.pressableKey));
      final Attribute? boxAttributes =
          vbox.mix.attributes.firstWhereOrNull((element) {
        try {
          return (element as BoxAttributes).color != null;
        } catch (e) {
          return false;
        }
      });

      expect(
        (boxAttributes as BoxAttributes?)?.color,
        ThemeSAKS.colors.special.leaf,
      );
    });
  });
}
