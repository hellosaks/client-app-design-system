import "package:client_app_design_system/theme/theme_saks.dart";
import "package:client_app_design_system/utils/enums/enums_dto.dart";
import "package:flutter/material.dart";

class ColorEnum implements EnumDto<Color> {
  @override
  Color parse(String enumType) {
    switch (enumType) {
      case "primary_saks":
        return ThemeSAKS.colors.primary.saks;
      case "primary_sea":
        return ThemeSAKS.colors.primary.sea;
      case "primary_sky":
        return ThemeSAKS.colors.primary.sky;
      case "secondary_anchor":
        return ThemeSAKS.colors.secondary.anchor;
      case "secondary_bay":
        return ThemeSAKS.colors.secondary.bay;
      case "secondary_ice":
        return ThemeSAKS.colors.secondary.ice;
      case "secondary_background":
        return ThemeSAKS.colors.secondary.background;
      case "special_leaf":
        return ThemeSAKS.colors.special.leaf;
      case "special_rose":
        return ThemeSAKS.colors.special.rose;
      case "special_smoke":
        return ThemeSAKS.colors.special.smoke;
      case "division":
        return ThemeSAKS.colors.grayscale.division;
      case "snow":
        return ThemeSAKS.colors.grayscale.snow;
      case "strong_grey":
        return ThemeSAKS.colors.grayscale.strongGrey;
      case "gray":
        return ThemeSAKS.colors.grayscale.gray;
      case "white":
        return Colors.white;
      case "red":
        return Colors.red;
      case "black":
        return Colors.black;
      default:
        return ThemeSAKS.colors.primary.sea;
    }
  }

  @override
  String stringfy(Color enumType) {
    throw UnimplementedError();
  }
}
