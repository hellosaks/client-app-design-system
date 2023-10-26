import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_theme/json_theme.dart";

class InfoCircularGraph {
  final Color color;
  final double value;

  InfoCircularGraph({
    required this.color,
    required this.value,
  }) : assert(
          !(value > 100 || value <= 0),
          "value value must be a value between 0 and 100",
        );

  factory InfoCircularGraph.fromJson(Map<String, dynamic> json) {
    return InfoCircularGraph(
      color: pick(json, "color").letOrThrow(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      value: pick(json, "value").asDoubleOrThrow(),
    );
  }
}
