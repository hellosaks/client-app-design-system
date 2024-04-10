import "package:client_app_design_system/client_app_design_system.dart";

class CustomIconEnum extends EnumDto<CustomIcons> {
  @override
  CustomIcons? canParse(String enumType) {
    switch (enumType) {
      case "icWhatsapp":
        return CustomIcons.icWhatsapp;
      case "icShare":
        return CustomIcons.icShare;
      case "icMultimedia":
        return CustomIcons.icMultimedia;
      case "icProfileIcon":
        return CustomIcons.icProfileIcon;
      case "icPiggyBank":
        return CustomIcons.icPiggyBank;
      case "icWorld":
        return CustomIcons.icWorld;
    }
    return null;
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
      case CustomIcons.icPiggyBank:
        return "icPiggyBank";
      case CustomIcons.icWorld:
        return "icWorld";
    }
  }

  @override
  CustomIcons get defaultEnum => CustomIcons.icMultimedia;
}
