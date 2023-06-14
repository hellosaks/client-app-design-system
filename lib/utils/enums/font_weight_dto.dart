import "package:client_app_design_system/utils/enums/enums_dto.dart";
import "package:flutter/material.dart";

class FontWeightEnum implements EnumDto<FontWeight> {
  @override
  FontWeight parse(String enumType) {
    switch (enumType) {
      case "bold":
        return FontWeight.bold;
      case "normal":
        return FontWeight.normal;
      case "w100":
        return FontWeight.w100;
      case "w200":
        return FontWeight.w200;
      case "w300":
        return FontWeight.w300;
      case "w500":
        return FontWeight.w500;
      case "w600":
        return FontWeight.w600;
      case "w800":
        return FontWeight.w800;
      case "w900":
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }

  @override
  String stringfy(FontWeight enumType) {
    switch (enumType) {
      case FontWeight.bold:
        return "bold";
      case FontWeight.normal:
        return "normal";
      case FontWeight.w100:
        return "w100";
      case FontWeight.w200:
        return "w200";
      case FontWeight.w300:
        return "w300";
      case FontWeight.w500:
        return "w500";
      case FontWeight.w600:
        return "w600";
      case FontWeight.w800:
        return "w800";
      case FontWeight.w900:
        return "w900";
      default:
        return "normal";
    }
  }
}
