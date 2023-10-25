import "package:circular_chart_flutter/circular_chart_flutter.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";

@docWidget
class CircularChartDistribution extends StatelessWidget {
  final List<InfoCircularGraph> listValues;

  const CircularChartDistribution({
    super.key,
    required this.listValues,
  });

  @override
  Widget build(BuildContext context) {
    return _buildChart();
  }

  Widget _buildChart() {
    return AnimatedCircularChart(
      size: const Size(120, 120),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            ...listValues.map((e) => _buildElement(element: e)),
          ],
          rankKey: "progress",
        ),
      ],
      percentageValues: true,
    );
  }

  CircularSegmentEntry _buildElement({required InfoCircularGraph element}) {
    return CircularSegmentEntry(
      element.value,
      element.color,
    );
  }
}
