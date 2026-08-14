import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/chart_distribution/chart_distribution.doc_widget.dart';
import 'package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:material_ui/material_ui.dart';

final List<InfoCircularGraph> data = [
  InfoCircularGraph(
    color: Colors.red,
    value: 20,
  ),
  InfoCircularGraph(
    color: Colors.black,
    value: 20,
  ),
  InfoCircularGraph(
    color: Colors.blue,
    value: 60,
    // convertedValue: '20%',
  )
];
final circularChart = ElementPreview(
  document: CircularChartDistributionDocWidget(),
  previews: [
    WidgetPreview(
      widget: CircularChartDistribution(
        listValues: data,
        height: 120,
        width: 120,
      ),
      description: 'chart distribution',
    ),
  ],
);
