import "package:flutter/material.dart";

class ColorAttributesButton {
  final Color bgColor;
  final Color pressColor;
  final Color insideColor;

  ColorAttributesButton({
    required this.pressColor,
    this.bgColor = Colors.transparent,
    this.insideColor = Colors.white,
  })  : assert(
          !(bgColor == insideColor),
          "backGround color and inside color can't not be equals",
        ),
        assert(
          !(pressColor == bgColor),
          "backGround color and press color can't not be equals",
        );
}
