import "package:client_app_design_system/client_app_design_system.dart";
import "package:client_app_design_system/utils/enums/enum_dto.dart";
import "package:client_app_design_system/utils/enums/enum_parse.dart";
import "package:client_app_design_system/utils/enums/icons/custom_icon_enum.dart";
import "package:client_app_design_system/utils/enums/icons/unicons_enum.dart";
import "package:client_app_design_system/utils/util_functions.dart";
import "package:deep_pick/deep_pick.dart";

class UniconsPropsDto implements SerializableJson<UniconsProps> {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  UniconsProps fromJson(Map<String, dynamic> json) {
    return UniconsProps(
      color: pick(json, "color")
          .letOrNull((pick) => colorDecoder(pick.asString())),
      size: pick(json, "size").asDoubleOrThrow(),
      icon: pick(json, "icon")
          .letOrThrow((pick) => UniconsLineEnum().parse(pick.asString())),
    );
  }
}

class CustomIconsPropsDto implements SerializableJson<CustomIconsProps> {
  @override
  CustomIconsProps fromJson(Map<String, dynamic> json) {
    return CustomIconsProps(
      color: pick(json, "color")
          .letOrNull((pick) => colorDecoder(pick.asString())),
      size: pick(json, "size").asDoubleOrThrow(),
      icon: pick(json, "icon")
          .letOrThrow((pick) => CustomIconEnum().parse(pick.asString())),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class IconPropsDto implements SerializableJson<IconProps> {
  @override
  IconProps fromJson(Map<String, dynamic> json) {
    return IconProps(
      variant: pick(json, "variant")
          .letOrThrow((pick) => IconVariantEnum().parse(pick.asString())),
      customIconsProps: pick(json, "customIconsProps").letOrNull(
        (pick) => CustomIconsPropsDto().fromJson(pick.asMapOrEmpty()),
      ),
      uniconsProps: pick(json, "uniconsProps")
          .letOrNull((pick) => UniconsPropsDto().fromJson(pick.asMapOrEmpty()),),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
