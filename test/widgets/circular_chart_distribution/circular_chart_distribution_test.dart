import "package:circular_chart_flutter/circular_chart_flutter.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

import "../../utils/test_wrappers.dart";

void main() {
  final List<InfoCircularGraph> data = [
    InfoCircularGraph(
      color: Colors.red,
      value: 60,
    ),
    InfoCircularGraph(
      color: Colors.black,
      value: 20,
    ),
    InfoCircularGraph(
      color: Colors.blue,
      value: 20,
    )
  ];
  group("CircularChartDistribution", () {
    testWidgets("should render correctly ", (WidgetTester tester) async {
      final widget = CircularChartDistribution(
        listValues: data,
        height: 120,
        width: 120,
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(find.byType(CircularChartDistribution), findsOneWidget);
    });

    testWidgets("should render correctly elements",
        (WidgetTester tester) async {
      final widget = CircularChartDistribution(
        listValues: data,
        height: 120,
        width: 120,
      );
      await tester.pumpWidget(wrapWithMaterialApp(widget));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is AnimatedCircularChart &&
              widget.size == const Size(120, 120),
        ),
        findsOneWidget,
      );
    });
  });
}
