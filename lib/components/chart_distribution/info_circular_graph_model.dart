import "package:material_ui/material_ui.dart";

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
}
