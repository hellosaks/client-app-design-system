import "package:client_app_design_system/client_app_design_system.dart";
import "package:flutter_test/flutter_test.dart";
import "package:material_ui/material_ui.dart" hide Icon;

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

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Container &&
              (widget.decoration as BoxDecoration?)?.color ==
                  ThemeSAKS.colors.primary.sea.withOpacity(0.15),
        ),
        findsOneWidget,
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
              widget.props.uniconsProps!.icon ==
                  UniconsLine.arrow_circle_right &&
              widget.props.uniconsProps!.size == 24 &&
              widget.props.uniconsProps!.color == ThemeSAKS.colors.primary.sea,
        ),
        findsOneWidget,
      );

      final circle =
          tester.widget<Container>(find.byKey(IndicationFilters.circleKey));
      final BoxDecoration decoration = circle.decoration! as BoxDecoration;
      expect(decoration.color, ThemeSAKS.colors.primary.sea);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is GestureDetector &&
              (widget.child is Container) &&
              ((widget.child as Container?)?.decoration as BoxDecoration?)
                      ?.color ==
                  ThemeSAKS.colors.primary.sky,
        ),
        findsOneWidget,
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
          tester.widget<Container>(find.byKey(IndicationFilters.circleKey));
      final BoxDecoration decoration = circle.decoration! as BoxDecoration;
      expect(decoration.color, ThemeSAKS.colors.utility.conservative);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is GestureDetector &&
              (widget.child is Container) &&
              ((widget.child as Container?)?.decoration as BoxDecoration?)
                      ?.color ==
                  ThemeSAKS.colors.special.leaf,
        ),
        findsOneWidget,
      );
    });
  });
}
