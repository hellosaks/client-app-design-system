import "package:circular_chart_flutter/circular_chart_flutter.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:client_app_design_system/utils/double_ext.dart";
import "package:doc_widget/doc_widget.dart";
import "package:flutter/material.dart";
import "package:mix/mix.dart";

@docWidget
class CircularChartDistribution extends StatelessWidget {
  final List<InfoCircularGraph> data;
  final Color bgColor;

  final String title;
  final String typeDistribution;
  const CircularChartDistribution({
    super.key,
    required this.data,
    required this.bgColor,
    required this.title,
    required this.typeDistribution,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildChart(),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        _buildInfoTitle(),
        const SizedBox(
          height: 10,
        ),
        _buildInfoFunds(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildInfoFunds() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ThemeSAKS.colors.grayscale.strongGrey,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...data.map((e) => _buildRow(element: e))]
              .expand((element) => [element, const SizedBox(height: 7)])
              .toList(),
        ),
      ),
    );
  }

  Widget _buildRow({required InfoCircularGraph element}) {
    final styles = Mix(
      textOverflow(TextOverflow.ellipsis),
      width(100),
    );
    return Row(
      children: [
        _buildCircle(element: element),
        const SizedBox(
          width: 10,
        ),
        Box(
          mix: styles,
          child: CustomTypography(
            mix: styles,
            variant: TypographyVariant.h6,
            text: element.fundName,
            color: ThemeSAKS.colors.primary.sea,
            align: TextAlign.center,
            weight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CustomTypography(
          variant: TypographyVariant.h6,
          text: _buildFormatedPercentage(element.percentage),
          color: ThemeSAKS.colors.primary.sea,
          align: TextAlign.center,
          weight: FontWeight.w500,
        ),
      ],
    );
  }

  Widget _buildCircle({required InfoCircularGraph element}) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: element.color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildInfoTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 30,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: title,
          color: ThemeSAKS.colors.grayscale.strongGrey,
          weight: FontWeight.w600,
        ),
        const SizedBox(
          width: 40,
        ),
        CustomTypography(
          variant: TypographyVariant.h7,
          text: typeDistribution,
          color: ThemeSAKS.colors.grayscale.strongGrey,
          weight: FontWeight.w600,
        )
      ],
    );
  }

  Widget _buildChart() {
    return AnimatedCircularChart(
      size: const Size(120, 120),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            ...data.map((e) => _buildElement(element: e)),
          ],
          rankKey: "progress",
        ),
      ],
      edgeStyle: SegmentEdgeStyle.round,
      percentageValues: true,
    );
  }

  CircularSegmentEntry _buildElement({required InfoCircularGraph element}) {
    return CircularSegmentEntry(
      _buildRowPercentage(element.percentage),
      element.color,
    );
  }

  double _buildRowPercentage(double value) {
    return value * 100;
  }

  String _buildFormatedPercentage(double value) {
    return value.formatAsPercentShort(decimalDigits: 1);
  }
}
