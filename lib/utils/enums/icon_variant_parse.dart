import "package:client_app_design_system/client_app_design_system.dart";

class IconVariantEnum extends EnumDto<IconVariant> {
  @override
  String stringfy(IconVariant enumType) {
    switch (enumType) {
      case IconVariant.unicons:
        return "unicons";
      case IconVariant.custom:
        return "custom";
    }
  }

  @override
  IconVariant? canParse(String enumType) {
    switch (enumType) {
      case "unicons":
        return IconVariant.unicons;
      case "custom":
        return IconVariant.custom;
    }
    return null;
  }

  @override
  IconVariant get defaultEnum => IconVariant.unicons;
}
