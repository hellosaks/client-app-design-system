import 'dart:convert';

import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/chart_distribution/chart_distribution.doc_widget.dart';
import 'package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:playground/render_service.dart';

class CircularChartDistributionView extends StatelessWidget {
  const CircularChartDistributionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "color": "#5274D8",
        "value": 100,
      }
    ];
    final json = {
      "type": "circular_chart_distribution",
      "args": {
        "values": data,
      }
    };

    return Column(
      children: [
        RenderService().buildJson(
          json: jsonEncode(json),
          context: context,
        ),
      ],
    );
  }
}

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
    // label: "Saks super prev",
    value: 60,
    // convertedValue: '20%',
  )
];
final chart = ElementPreview(
  document: CircularChartDistributionDocWidget(),
  previews: [
    WidgetPreview(
      widget: CircularChartDistribution(
        // bgColor: ThemeDecoder.decodeColor("#F4F7FA")!,
        listValues: data,
        // typeDistribution: '%',
        // title: 'Distribuição',
      ),
      description: 'chart distribution',
    ),
    WidgetPreview(
      widget: const CircularChartDistributionView(),
      description: 'Example dynamic chart distribution',
    ),
  ],
);
