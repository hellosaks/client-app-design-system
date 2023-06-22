import "package:client_app_design_system/client_app_design_system.dart";
import "package:deep_pick/deep_pick.dart";

class ButtonPropertiesDto implements SerializableJson<ButtonProperties> {
  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  ButtonProperties fromJson(Map<String, dynamic> json) {
    final void Function() onPressed = json["onPressed"] as void Function();
    return ButtonProperties(
      onPressed: onPressed,
      title: pick(json, "title").asStringOrThrow(),
    );
  }
}
