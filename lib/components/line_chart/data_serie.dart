import "package:client_app_design_system/components/line_chart/data_point.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_theme/json_theme.dart";

class DataSerie {
  final List<DataPoint> serie;
  final Color color;
  final String name;

  DataSerie({
    required this.serie,
    required this.color,
    required this.name,
  });

  factory DataSerie.fromJson(Map<String, dynamic> json) {
    return DataSerie(
      name: pick(json, "name").asStringOrThrow(),
      color: pick(json, "color").letOrThrow(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      serie: pick(json, "serie").asListOrThrow(
        (pick) => DataPoint.fromJson(pick.asMapOrThrow()),
      ),
    );
  }
}
