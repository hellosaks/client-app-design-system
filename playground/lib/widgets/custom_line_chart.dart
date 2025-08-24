import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/line_chart/data_point.dart';
import 'package:client_app_design_system/components/line_chart/data_serie.dart';
import 'package:client_app_design_system/components/line_chart/line_chart.doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

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
      widget: LineChartGraph(series: dataSerieCurrency),
      description: 'custom line chart for currency values',
    ),
    WidgetPreview(
      widget: LineChartGraph(series: dataSeriePercentage),
      description: 'custom line chart for percentage values',
    ),
  ],
);
