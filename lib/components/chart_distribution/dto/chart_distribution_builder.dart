import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/components/chart_distribution/chart_distribution.dart";
import "package:client_app_design_system/components/chart_distribution/info_circular_graph_model.dart";
import "package:client_app_design_system/utils/util_functions.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CircularChartDistributionBuilder extends JsonWidgetBuilder {
  static const type = "circular_chart_distribution";
  final Color bgColor;

  final List<InfoCircularGraph> listFund;
  final String title;
  final String typeDistribution;
  const CircularChartDistributionBuilder({
    required this.bgColor,
    required this.listFund,
    required super.numSupportedChildren,
    required this.title,
    required this.typeDistribution,
  });

  factory CircularChartDistributionBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CircularChartDistributionBuilder(
      listFund: pick(json, "data").asListOrThrow(
        (pick) => InfoCircularGraph.fromJson(pick.asMapOrThrow()),
      ),
      bgColor: pick(json, "bg_color")
          .letOrThrow((pick) => colorDecoder(pick.asStringOrThrow())),
      numSupportedChildren: 1,
      title: pick(json, "title").asStringOrThrow(),
      typeDistribution: pick(json, "type_distribution").asStringOrThrow(),
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
      bgColor: bgColor,
      data: listFund,
      title: title,
      typeDistribution: typeDistribution,
    );
  }
}
