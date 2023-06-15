import "package:client_app_design_system/client_app_design_system.dart";

class IconVariantEnum implements EnumDto<IconVariant> {
  @override
  IconVariant parse(String enumType) {
    switch (enumType) {
      case "unicons":
        return IconVariant.unicons;
      case "custom":
        return IconVariant.custom;
      default:
        return IconVariant.unicons;
    }
  }

  @override
  String stringfy(IconVariant enumType) {
    switch (enumType) {
      case IconVariant.unicons:
        return "unicons";
      case IconVariant.custom:
        return "custom";
    }
  }
}
