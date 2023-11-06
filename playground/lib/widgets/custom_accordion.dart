import 'package:client_app_design_system/client_app_design_system.dart';
import 'package:client_app_design_system/components/accordion/custom_accordion.doc_widget.dart';
import 'package:client_app_design_system/components/line_chart/data_point.dart';
import 'package:client_app_design_system/components/line_chart/data_serie.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

class CustomAccordionView extends StatefulWidget {
  const CustomAccordionView({super.key});

  @override
  State<CustomAccordionView> createState() => _CustomAccordionViewState();
}

class _CustomAccordionViewState extends State<CustomAccordionView> {
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

  double initialValue = 10;

  @override
  void initState() {
    super.initState();
  }

  String _buildValue({required double value}) {
    return value.toString();
  }

  Widget _buildSubtitle() {
    return CustomTypography(
      variant: TypographyVariant.h6,
      text: _buildValue(value: initialValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAccordion(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTypography(
            variant: TypographyVariant.h6,
            weight: FontWeight.bold,
            text: "Value",
          ),
          _buildSubtitle()
        ],
      ),
      backgroundColor: ThemeSAKS.colors.grayscale.gray,
      collapsedBackgroundColor: ThemeSAKS.colors.grayscale.gray,
      children: [
        CustomLineChart(
          // formatType: dataSerie,
          interactive: true,
          series: dataSerieCurrency,
          height: 250,
          title: "titleLarge",
          subtitle: "subtitle",
        ),
      ],
    );
  }
}

final customAccordion = ElementPreview(
  document: CustomAccordionDocWidget(), // From generated file
  previews: [
    WidgetPreview(
      widget: const CustomAccordionView(),
      description: 'custom accordion',
    ),
  ],
);
