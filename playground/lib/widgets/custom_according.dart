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
  final List<DataSerie> dataSerie = [
    DataSerie(
      formatType: FormartType.currency,
      serie: [
        DataPoint(
          value: 4.8,
          index: 0,
          date: DateTime.now(),
        ),
        DataPoint(
          value: 4.8,
          index: 1,
          date: DateTime.now(),
        ),
        DataPoint(
          value: 4.93,
          index: 2,
          date: DateTime.now(),
        ),
        DataPoint(
          value: 4.98,
          index: 3,
          date: DateTime.now(),
        ),
        DataPoint(
          value: 5.02,
          index: 4,
          date: DateTime.now(),
        )
      ],
      color: Colors.red,
      name: "Dólar",
    )
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
          series: dataSerie,
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
