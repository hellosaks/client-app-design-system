import "package:deep_pick/deep_pick.dart";

class DataPoint {
  String? tooltipX;
  String? tooltipY;
  double value;

  DataPoint({
    this.tooltipX,
    this.tooltipY,
    required this.value,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      value: pick(json, "value").asDoubleOrThrow(),
      tooltipX: pick(json, "tooltip_x").asStringOrNull(),
      tooltipY: pick(json, "tooltip_y").asStringOrNull(),
    );
  }
}
