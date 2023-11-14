import "package:client_app_design_system/utils/enums/enums_dto.dart";
import "package:flutter/material.dart";

class ListTileControlAffinityEnum implements EnumDto<ListTileControlAffinity> {
  @override
  ListTileControlAffinity parse(String enumType) {
    switch (enumType) {
      case "leading":
        return ListTileControlAffinity.leading;
      case "trailing":
        return ListTileControlAffinity.trailing;
      case "platform":
        return ListTileControlAffinity.platform;
      default:
        return ListTileControlAffinity.trailing;
    }
  }

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
}
