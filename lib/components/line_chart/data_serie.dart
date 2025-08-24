import "package:client_app_design_system/components/line_chart/data_point.dart";
import "package:flutter/material.dart";

class DataSerie {
  final List<DataPoint> serie;
  final Color color;
  final String name;

  DataSerie({
    required this.serie,
    required this.color,
    required this.name,
  });
}
