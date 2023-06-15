import "package:client_app_design_system/client_app_design_system.dart";

class CustomIconEnum implements EnumDto<CustomIcons> {
  @override
  CustomIcons parse(String enumType) {
    switch (enumType) {
      case "icWhatsapp":
        return CustomIcons.icWhatsapp;
      case "icShare":
        return CustomIcons.icShare;
      case "icMultimedia":
        return CustomIcons.icMultimedia;
      case "icProfileIcon":
        return CustomIcons.icProfileIcon;
      default:
        return CustomIcons.icMultimedia;
    }
  }

  @override
  String stringfy(CustomIcons enumType) {
    switch (enumType) {
      case CustomIcons.icWhatsapp:
        return "icWhatsapp";
      case CustomIcons.icShare:
        return "icShare";
      case CustomIcons.icMultimedia:
        return "icMultimedia";
      case CustomIcons.icProfileIcon:
        return "icProfileIcon";
    }
  }
}
