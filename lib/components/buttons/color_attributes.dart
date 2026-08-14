import "package:material_ui/material_ui.dart";

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
}
