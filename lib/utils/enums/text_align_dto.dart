import "package:client_app_design_system/utils/enums/enums_dto.dart";
import "package:flutter/material.dart";

class TextAlignEnum implements EnumDto<TextAlign> {
  @override
  TextAlign parse(String enumType) {
    switch (enumType) {
      case "left":
        return TextAlign.left;
      case "right":
        return TextAlign.right;
      case "center":
        return TextAlign.center;
      case "justify":
        return TextAlign.justify;
      case "start":
        return TextAlign.start;
      case "end":
        return TextAlign.end;

      default:
        return TextAlign.left;
    }
  }

  @override
  String stringfy(TextAlign enumType) {
    switch (enumType) {
      case TextAlign.left:
        return "left";
      case TextAlign.right:
        return "right";
      case TextAlign.center:
        return "center";
      case TextAlign.justify:
        return "justify";
      case TextAlign.start:
        return "start";
      case TextAlign.end:
        return "end";
    }
  }
}
