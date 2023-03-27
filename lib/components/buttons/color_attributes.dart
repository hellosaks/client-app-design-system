import "dart:convert";

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

  ColorAttributesButton copyWith({
    Color? bgColor,
    Color? pressColor,
    Color? insideColor,
    Color? outsideColor,
  }) {
    return ColorAttributesButton(
      bgColor: bgColor ?? this.bgColor,
      pressColor: pressColor ?? this.pressColor,
      insideColor: insideColor ?? this.insideColor,
      outsideColor: outsideColor ?? this.outsideColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "bgColor": bgColor.value,
      "pressColor": pressColor.value,
      "insideColor": insideColor.value,
      "outsideColor": outsideColor?.value,
    };
  }

  factory ColorAttributesButton.fromMap(Map<String, dynamic> map) {
    return ColorAttributesButton(
      bgColor: Color(map["bgColor"] as int),
      pressColor: Color(map["pressColor"] as int),
      insideColor: Color(map["insideColor"] as int),
      outsideColor: map["outsideColor"] != null
          ? Color(map["outsideColor"] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorAttributesButton.fromJson(String source) =>
      ColorAttributesButton.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return "ColorAttributesButton(bgColor: $bgColor, pressColor: $pressColor, insideColor: $insideColor, outsideColor: $outsideColor)";
  }

  @override
  bool operator ==(covariant ColorAttributesButton other) {
    if (identical(this, other)) return true;

    return other.bgColor == bgColor &&
        other.pressColor == pressColor &&
        other.insideColor == insideColor &&
        other.outsideColor == outsideColor;
  }

  @override
  int get hashCode {
    return bgColor.hashCode ^
        pressColor.hashCode ^
        insideColor.hashCode ^
        outsideColor.hashCode;
  }
}
