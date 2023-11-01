import "package:client_app_design_system/components/line_chart/data_point.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";
import "package:json_theme/json_theme.dart";

enum FormartType {
  percentage,
  currency;

  static FormartType parse({required String value}) {
    switch (value) {
      case "percentage":
        return FormartType.percentage;
      case "currency":
        return FormartType.currency;
      default:
        return FormartType.percentage;
    }
  }
}

class DataSerie {
  final List<DataPoint> serie;
  final Color color;
  final String name;
  final FormartType formatType;
  DataSerie({
    required this.serie,
    required this.color,
    required this.name,
    required this.formatType,
  });

  factory DataSerie.fromJson(Map<String, dynamic> json) {
    return DataSerie(
      name: pick(json, "name").asStringOrThrow(),
      formatType: pick(json, "format_type").letOrThrow(
        (p0) => FormartType.parse(value: p0.asStringOrThrow()),
      ),
      color: pick(json, "color").letOrThrow(
        (pick) => ThemeDecoder.decodeColor(pick.asStringOrThrow())!,
      ),
      serie: pick(json, "serie").asListOrThrow(
        (pick) => DataPoint.fromJson(pick.asMapOrThrow()),
      ),
    );
  }
}
