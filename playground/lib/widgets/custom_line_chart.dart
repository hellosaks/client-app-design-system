import 'dart:convert';

import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/line_chart/data_point.dart';
import 'package:client_app_design_system/components/line_chart/data_serie.dart';
import 'package:client_app_design_system/components/line_chart/line_chart.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:playground/render_service.dart';

final List<DataSerie> dataSerieCurrency = [
  DataSerie(
    serie: [
      DataPoint(
        value: 4.8,
        tooltipX: "\$ 4.8",
        tooltipY: "01/01/2023",
      ),
      DataPoint(
        value: 4.8,
        tooltipX: "\$ 4.8",
        tooltipY: "02/01/2023",
      ),
      DataPoint(
        value: 4.93,
        tooltipX: "\$ 4.93",
        tooltipY: "03/01/2023",
      ),
      DataPoint(
        value: 4.98,
        tooltipX: "\$ 4.98",
        tooltipY: "04/01/2023",
      ),
      DataPoint(
        value: 5.02,
        tooltipX: "\$ 5.02",
        tooltipY: "05/01/2023",
      )
    ],
    color: Colors.red,
    name: "Dólar",
  ),
  DataSerie(
    serie: [
      DataPoint(
        value: 5.8,
        tooltipX: "€ 5.8",
        tooltipY: "01/01/2023",
      ),
      DataPoint(
        value: 5.8,
        tooltipX: "€ 5.8",
        tooltipY: "02/01/2023",
      ),
      DataPoint(
        value: 5.93,
        tooltipX: "€ 5.93",
        tooltipY: "03/01/2023",
      ),
      DataPoint(
        value: 5.98,
        tooltipX: "€ 5.98",
        tooltipY: "04/01/2023",
      ),
      DataPoint(
        value: 6.02,
        tooltipX: "€ 6.02",
        tooltipY: "05/01/2023",
      )
    ],
    color: Colors.green,
    name: "Euro",
  ),
];
final List<DataSerie> dataSeriePercentage = [
  DataSerie(
    serie: [
      DataPoint(
        value: 0.8,
        tooltipX: "80%",
        tooltipY: "01/01/2023",
      ),
      DataPoint(
        value: 0.85,
        tooltipX: "85%",
        tooltipY: "02/01/2023",
      ),
      DataPoint(
        value: 0.532,
        tooltipX: "53.2%",
        tooltipY: "03/01/2023",
      ),
    ],
    color: Colors.red,
    name: "Milho (var%)",
  ),
];

class LineChartGraphView extends StatelessWidget {
  const LineChartGraphView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final json = {
      "type": "custom_accordion",
      "child": {
        "type": "column",
        "children": [
          {
            "type": "custom_line_chart",
            "args": {
              "interactive": true,
              "initially_expanded": true,
              "title": "Variação Dólar",
              "subtitle": "Últimos 30 dias",
              "height": 260,
              "interval": 1,
              "data": [
                {
                  "color": "#40BF6A",
                  'name': "Dólar",
                  "format_type": "currency",
                  "serie": [
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 5.689,
                      "tooltip_x": "\$ 5.689"
                    },
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 5.789,
                      "tooltip_x": "\$ 5.789"
                    },
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 5.089,
                      "tooltip_x": "\$ 5.089"
                    },
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 5.089,
                      "tooltip_x": "\$ 5.089"
                    },
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 4.089,
                      "tooltip_x": "\$ 4.089"
                    },
                    {
                      "tooltip_y": "2023-10-08",
                      "value": 3.089,
                      "tooltip_x": "\$ 3.089"
                    },
                  ]
                }
              ]
            }
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 20,
            }
          },
          {
            "type": "row",
            "args": {
              'mainAxisAlignment': 'spaceBetween',
            },
            "children": [
              {
                "type": "custom_typography",
                "args": {
                  "text": "Máxima",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
              {
                "type": "custom_typography",
                "args": {
                  "text": "R\$ 6,00",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
            ]
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 5,
            }
          },
          {
            "type": 'custom_divider',
            "args": {
              "color": '#aaa',
            },
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 5,
            }
          },
          {
            "type": "row",
            "args": {
              'mainAxisAlignment': 'spaceBetween',
            },
            "children": [
              {
                "type": "custom_typography",
                "args": {
                  "text": "Média",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
              {
                "type": "custom_typography",
                "args": {
                  "text": "R\$ 6,00",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
            ]
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 5,
            }
          },
          {
            "type": 'custom_divider',
            "args": {
              "color": '#aaa',
            },
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 5,
            }
          },
          {
            "type": "row",
            "args": {
              'mainAxisAlignment': 'spaceBetween',
            },
            "children": [
              {
                "type": "custom_typography",
                "args": {
                  "text": "Mínima",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
              {
                "type": "custom_typography",
                "args": {
                  "text": "R\$ 6,00",
                  "variant": "h6",
                  "weight": "w400",
                  "color": "#131C2F"
                }
              },
            ]
          },
          {
            "type": 'sized_box',
            "args": {
              "height": 5,
            }
          },
        ]
      },
      "args": {
        "bg_color": "#FFF",
        "collapsed_bg_color": "#FFF",
        "icon_color": "#000",
        "title": {
          "type": "row",
          "children": [
            {
              "type": "column",
              "args": {
                "crossAxisAlignment": 'start',
              },
              "children": [
                {
                  "type": "custom_typography",
                  "args": {
                    "text": "Dólar Hoje",
                    "variant": "h6",
                    "weight": "w500",
                    "color": "#A1A8B4"
                  }
                },
                {
                  "type": "row",
                  "children": [
                    {
                      "type": "custom_icon",
                      "args": {
                        "props": {
                          "variant": "unicons",
                          "uniconsProps": {
                            "color": "#2CA735",
                            "icon": "angle_up",
                          }
                        }
                      },
                    },
                    {
                      "type": "custom_typography",
                      "args": {
                        "text": "R\$ 5,00",
                        "variant": "h5",
                        "weight": "w600",
                        "color": "#2CA735"
                      }
                    },
                  ]
                },
              ]
            },
            {
              "type": 'sized_box',
              "args": {
                "width": 80,
              }
            },
            {
              "type": "expanded",
              "child": {
                "type": "secondary_button",
                "args": {
                  "text": "Enviar USD",
                  "onPressed": "\${noop()}",
                  "color_attribrutes": {
                    "press_color": "#131C20",
                    "bg_color": "#131C2F",
                  }
                }
              }
            },
          ]
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

class LineChartGraph extends StatelessWidget {
  final List<DataSerie> series;

  const LineChartGraph({required this.series});

  @override
  Widget build(BuildContext context) {
    return CustomLineChart(
      interactive: true,
      series: series,
      height: 250,
      title: "titleLarge",
      subtitle: "subtitle",
    );
  }
}

final customLineChart = ElementPreview(
  document: CustomLineChartDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const LineChartGraphView(),
      description: 'custom line chart',
    ),
    WidgetPreview(
      widget: LineChartGraph(series: dataSerieCurrency),
      description: 'custom line chart for currency values',
    ),
    WidgetPreview(
      widget: LineChartGraph(series: dataSeriePercentage),
      description: 'custom line chart for percentage values',
    ),
  ],
);
