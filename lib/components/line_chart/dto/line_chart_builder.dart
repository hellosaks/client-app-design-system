import "package:child_builder/child_builder.dart";
import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/components/line_chart/data_serie.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_dynamic_widget/json_dynamic_widget.dart";

class CustomLineChartBuilder extends JsonWidgetBuilder {
  final List<DataSerie> dataSerie;
  final bool showXAxisAsNumbers;
  final bool defaultStyle;
  final double interval;
  final bool interactive;
  final double height;

  final String title;
  final String subtitle;

  const CustomLineChartBuilder({
    required this.title,
    required this.subtitle,
    required this.dataSerie,
    required this.height,
    required this.interval,
    this.showXAxisAsNumbers = false,
    this.defaultStyle = true,
    this.interactive = false,
    required super.numSupportedChildren,
  });

  static const type = "custom_line_chart";

  factory CustomLineChartBuilder.fromDynamic(
    Map<dynamic, dynamic> json, {
    // ignore: avoid_unused_constructor_parameters
    JsonWidgetRegistry? registry,
  }) {
    return CustomLineChartBuilder(
      interactive: pick(json, "interactive").asBoolOrFalse(),
      numSupportedChildren: 1,
      interval: pick(json, "interval").asDoubleOrThrow(),
      height: pick(json, "height").asDoubleOrThrow(),
      dataSerie: pick(json, "data").letOrThrow(
        (p0) => p0.asListOrThrow(
          (p0) => DataSerie.fromJson(
            p0.asMapOrThrow(),
          ),
        ),
      ),
      subtitle: pick(json, "subtitle").asStringOrThrow(),
      title: pick(json, "title").asStringOrThrow(),
    );
  }

  @override
  Widget buildCustom({
    ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key,
  }) {
    return CustomLineChart(
      interval: interval,
      interactive: interactive,
      series: dataSerie,
      height: height,
      subtitle: subtitle,
      title: title,
    );
  }
}
