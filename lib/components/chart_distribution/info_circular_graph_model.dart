import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";

class InfoCircularGraph {
  final Color color;
  final double percentage;
  final String fundName;

  InfoCircularGraph({
    required this.color,
    required this.percentage,
    required this.fundName,
  }) : assert(
          !(percentage > 1 || percentage <= 0),
          "percentage value must be a value between 0 and 1",
        );

  factory InfoCircularGraph.fromJson(Map<String, dynamic> json) {
    return InfoCircularGraph(
      color: pick(json, "color")
          .letOrThrow((pick) => colorDecoder(pick.asStringOrThrow())),
      fundName: pick(json, "fund_name").asStringOrThrow(),
      percentage: pick(json, "percentage").asDoubleOrThrow(),
    );
  }
}
