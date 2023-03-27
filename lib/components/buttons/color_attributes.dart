import "package:flutter/material.dart";

class ColorAttributesButton {
  final Color bgColor;
  final Color pressColor;
  final Color insideColor;
  final Color? outsideColor;

  ColorAttributesButton({
    required this.pressColor,
    this.bgColor = Colors.transparent,
    this.insideColor = Colors.white,
    this.outsideColor,
  })  : assert(
          !(bgColor == insideColor),
          "background color and inside color can't not be equals",
        ),
        assert(
          !(pressColor == bgColor),
          "background color and press color can't not be equals",
        );
}
