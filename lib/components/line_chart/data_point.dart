import "package:deep_pick/deep_pick.dart";

class DataPoint {
  DateTime? date;
  int? index;
  double value;

  DataPoint({
    this.date,
    this.index,
    required this.value,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      value: pick(json, "value").asDoubleOrThrow(),
      index: pick(json, "index").asIntOrNull(),
      date: pick(json, "date").asDateTimeOrNull(),
    );
  }
}
