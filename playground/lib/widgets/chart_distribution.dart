import 'dart:convert';

import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/chart_distribution/chart_distribution.doc_widget.dart';
import 'package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
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
        "fund_name": "Saks Super...",
        "percentage": 1,
      }
    ];
    final json = {
      "type": "circular_chart_distribution",
      "args": {
        "bg_color": "#F4F7FA",
        "data": data,
        "title": "Distribuição",
        "type_distribution": "%"
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
    fundName: "Saks super prev",
    percentage: 0.5630,
  ),
  InfoCircularGraph(
    color: Colors.black,
    fundName: "Saks super prev",
    percentage: 0.2270,
  ),
  InfoCircularGraph(
    color: Colors.blue,
    fundName: "Saks super prev",
    percentage: 0.22,
  )
];
final chart = ElementPreview(
  document: CircularChartDistributionDocWidget(),
  previews: [
    WidgetPreview(
      widget: CircularChartDistribution(
        bgColor: colorDecoder("#F4F7FA"),
        data: data,
        typeDistribution: '%',
        title: 'Distribuição',
      ),
      description: 'chart distribution',
    ),
    WidgetPreview(
      widget: const CircularChartDistributionView(),
      description: 'Example dynamic chart distribution',
    ),
  ],
);
