import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/components/chart_distribution/chart_distribution.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CircularChartDistributionBuilder extends JsonWidgetBuilder {
  static const type = "circular_chart_distribution";

  final List<InfoCircularGraph> values;
  final double width;
  final double height;
  const CircularChartDistributionBuilder({
    required this.values,
    required super.numSupportedChildren,
    required this.width,
    required this.height,
  });

  factory CircularChartDistributionBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CircularChartDistributionBuilder(
      values: pick(json, "values")
          .asListOrThrow((p0) => InfoCircularGraph.fromJson(p0.asMapOrThrow())),
      numSupportedChildren: 1,
      height: pick(json, "height").asDoubleOrThrow(),
      width: pick(json, "width").asDoubleOrThrow(),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    assert(
      data.children?.isNotEmpty != true,
      "[CircularChartDistribution] does not support children.",
    );

    return CircularChartDistribution(
      listValues: values,
      height: 120,
      width: 120,
    );
  }
}
