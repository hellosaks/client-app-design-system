import 'dart:convert';

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
                    {"date": "2023-10-08 20:59:05.666", "value": 5.689},
                    {"date": "2023-10-08 20:59:05.666", "value": 5.789},
                    {"date": "2023-10-08 20:59:05.666", "value": 5.089},
                    {"date": "2023-10-08 20:59:05.666", "value": 5.089},
                    {"date": "2023-10-08 20:59:05.666", "value": 4.089},
                    {"date": "2023-10-08 20:59:05.666", "value": 3.089},
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

final customLineChart = ElementPreview(
  document: CustomLineChartDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const LineChartGraphView(),
      description: 'custom line chart',
    ),
  ],
);
