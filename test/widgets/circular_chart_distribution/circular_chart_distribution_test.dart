import "package:circular_chart_flutter/circular_chart_flutter.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:client_app_design_system/utils/double_ext.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  final List<InfoCircularGraph> data = [
    InfoCircularGraph(
      color: Colors.red,
      fundName: "Saks super prev 1",
      percentage: 0.5630,
    ),
    InfoCircularGraph(
      color: Colors.black,
      fundName: "Saks super prev 2",
      percentage: 0.2270,
    ),
    InfoCircularGraph(
      color: Colors.blue,
      fundName: "Saks super prev 3",
      percentage: 0.22,
    )
  ];
  group("CircularChartDistribution", () {
    testWidgets("should render correctly ", (WidgetTester tester) async {
      final widget = CircularChartDistribution(
        bgColor: colorDecoder("#F4F7FA"),
        data: data,
        title: "",
        typeDistribution: "",
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CircularChartDistribution), findsOneWidget);
    });

    testWidgets("should render correctly elements",
        (WidgetTester tester) async {
      final widget = CircularChartDistribution(
        bgColor: colorDecoder("#F4F7FA"),
        data: data,
        title: "Distribuição",
        typeDistribution: "%",
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is AnimatedCircularChart &&
              widget.size == const Size(120, 120) &&
              widget.initialChartData?.length == data.length,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "Distribuição" &&
              widget.color == ThemeSAKS.colors.grayscale.strongGrey &&
              widget.weight == FontWeight.w600 &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomTypography &&
              widget.text == "%" &&
              widget.color == ThemeSAKS.colors.grayscale.strongGrey &&
              widget.weight == FontWeight.w600 &&
              widget.variant == TypographyVariant.h7,
        ),
        findsOneWidget,
      );

      for (final element in data) {
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text == element.fundName &&
                widget.color == ThemeSAKS.colors.primary.sea &&
                widget.weight == FontWeight.w500 &&
                widget.variant == TypographyVariant.h6,
          ),
          findsOneWidget,
        );

        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is CustomTypography &&
                widget.text ==
                    element.percentage.formatAsPercentShort(decimalDigits: 1) &&
                widget.color == ThemeSAKS.colors.primary.sea &&
                widget.weight == FontWeight.w500 &&
                widget.variant == TypographyVariant.h6,
          ),
          findsOneWidget,
        );
      }
    });
  });
}
