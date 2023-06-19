import "package:client_app_design_system/utils/util_functions.dart";
import "package:deep_pick/deep_pick.dart";
import "package:flutter/material.dart";

class ColorAttributesButton {
  final Color bgColor;
  final Color pressColor;
  final Color insideColor;
  final Color? borderColor;

  ColorAttributesButton({
    required this.pressColor,
    this.bgColor = Colors.transparent,
    this.insideColor = Colors.white,
    this.borderColor,
  })  : assert(
          !(bgColor == insideColor),
          "background color and inside color can't not be equals",
        ),
        assert(
          !(bgColor == borderColor),
          "background color and border color can't not be equals",
        ),
        assert(
          !(pressColor == bgColor),
          "background color and press color can't not be equals",
        );

  factory ColorAttributesButton.fromJson(Map<String, dynamic> json) {
    return ColorAttributesButton(
      pressColor: pick(json, "press_color")
          .letOrThrow((pick) => colorDecoder(pick.asString())),
      insideColor: pick(json, "inside_color")
          .letOrThrow((pick) => colorDecoder(pick.asString())),
      borderColor: pick(json, "border_color")
          .letOrNull((pick) => colorDecoder(pick.asString())),
      bgColor: pick(json, "bg_color")
          .letOrThrow((pick) => colorDecoder(pick.asString())),
    );
  }
}
