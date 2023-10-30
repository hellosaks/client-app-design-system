import 'dart:convert';

import 'package:client_app_design_system/components/line_chart/data_point.dart';
import 'package:client_app_design_system/components/line_chart/data_serie.dart';
import 'package:client_app_design_system/components/line_chart/line_chart.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:playground/render_service.dart';

class LineChartGraphView extends StatelessWidget {
  const LineChartGraphView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final json = {
      "type": "custom_accordion",
      "child": {
        "type": "custom_line_chart",
        "args": {
          "initially_expanded": true,
          "title": "Variação Dólar",
          "subtitle": "Últimos 30 dias",
          "height": 260,
          "interval": 1,
          "data": [
            {
              "color": "#40BF6A",
              'name': "dolar",
              "serie": [
                {
                  "value": 1,
                },
                {
                  "value": 1,
                },
                {
                  "value": 7,
                },
                {
                  "value": 1,
                },
                {
                  "value": 5,
                },
                {
                  "value": 3,
                }
              ]
            }
          ]
        }
      },
      "args": {
        "bg_color": "#FFF",
        "collapsed_bg_color": "#000",
        "icon_color": "#000",
        "title": {
          "type": "custom_typography",
          "args": {
            "text": "Hello, world!",
            "variant": "h5",
            "weight": "w600",
          }
        }
      },
    };
    return Column(
      children: [
        RenderService().buildJson(
          json: jsonEncode(json),
          context: context,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

final List<DataSerie> data = [
  DataSerie(
    serie: [
      DataPoint(value: 1),
      DataPoint(value: 2),
      DataPoint(value: 5),
      DataPoint(value: 3),
      DataPoint(value: 1)
    ],
    color: Colors.red,
    name: "Teste",
  ),
];

final customLineChart = ElementPreview(
  document: CustomLineChartDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const LineChartGraphView(),
      description: 'custom line chart',
    ),
  ],
);
