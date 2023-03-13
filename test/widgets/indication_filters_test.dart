import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/indication_filters.dart";
import "package:flutter/material.dart" hide Icon;
import "package:flutter_test/flutter_test.dart";
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
                widget.color == NewThemeSAKS.colors.primary.sea &&
                widget.weight == FontWeight.bold &&
                widget.variant == TypographyVariant.h4,
          ),
          findsOneWidget);
      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == "2" &&
                widget.color == NewThemeSAKS.colors.special.leaf &&
                widget.weight == FontWeight.bold &&
                widget.variant == TypographyVariant.h4,
          ),
          findsOneWidget);

      expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.props.heroIconsProps!.icon ==
                    HeroIcons.arrowRightCircle &&
                widget.props.heroIconsProps!.size == 24 &&
                widget.props.heroIconsProps!.color ==
                    NewThemeSAKS.colors.primary.sea,
          ),
          findsOneWidget);

      final circle =
          tester.widget<Box>(find.byKey(IndicationFilters.circleKey));
      final List<Attribute> attributes = circle.mix.attributes;
      expect((attributes[2] as BoxAttributes).color,
          NewThemeSAKS.colors.primary.sea);

      final box = tester.widget<Box>(find.byKey(IndicationFilters.boxKey));
      final List<Attribute> attributes2 = box.mix.attributes;
      expect((attributes2[0] as BoxAttributes).color,
          NewThemeSAKS.colors.primary.sea);

      final VBox vbox = tester.widget(find.byKey(IndicationFilters.vboxKey));
      expect((vbox.mix.attributes.elementAt(2) as BoxAttributes).color,
          NewThemeSAKS.colors.primary.sky);
    });

    testWidgets(" Filter.activated attributes", (WidgetTester tester) async {
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
      expect((attributes[2] as BoxAttributes).color,
          NewThemeSAKS.colors.utility.conservative);

      final VBox vbox = tester.widget(find.byKey(IndicationFilters.vboxKey));
      expect((vbox.mix.attributes.elementAt(2) as BoxAttributes).color,
          NewThemeSAKS.colors.special.leaf);
    });
  });
}
