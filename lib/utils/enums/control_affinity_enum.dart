import "package:client_app_design_system/utils/enums/enums_dto.dart";
import "package:material_ui/material_ui.dart";

class ListTileControlAffinityEnum extends EnumDto<ListTileControlAffinity> {
  @override
  String stringfy(ListTileControlAffinity enumType) {
    switch (enumType) {
      case ListTileControlAffinity.leading:
        return "leading";
      case ListTileControlAffinity.trailing:
        return "trailing";
      case ListTileControlAffinity.platform:
        return "platform";
      default:
        return "platform";
    }
  }

  @override
  ListTileControlAffinity? canParse(String enumType) {
    switch (enumType) {
      case "leading":
        return ListTileControlAffinity.leading;
      case "trailing":
        return ListTileControlAffinity.trailing;
      case "platform":
        return ListTileControlAffinity.platform;
    }
    return null;
  }

  @override
  // TODO: implement defaultEnum
  ListTileControlAffinity get defaultEnum => ListTileControlAffinity.trailing;
}
